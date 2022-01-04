function fixup_ssh_auth_sock() {
    # Only do anything if we are an SSH client.
    if [ -z "${SSH_CLIENT}" ]; then
        return 0
    fi

    if [ -z "${_STABLE_SSH_AUTH_SOCK}" ]; then
        export _STABLE_SSH_AUTH_SOCK="${TMPDIR:-/tmp}/ssh-auth-sock-$USER"
    fi

    if [ ! -v "${_ORIGINAL_SSH_AUTH_SOCK}" ]; then
        export _ORIGINAL_SSH_AUTH_SOCK="${SSH_AUTH_SOCK}"
    fi

    # Build a list of candidate auth sock.
    local candidates=( )

    # Candidate 0: The original SSH_AUTH_SOCK from this session, if it exists and differs from the one in use now.
    # Rationale: if this command is being run again, it's probably for a reason.
    if [ -n "${_ORIGINAL_SSH_AUTH_SOCK}" -a \
            -e "${_ORIGINAL_SSH_AUTH_SOCK}" -a \
            "${_ORIGINAL_SSH_AUTH_SOCK}" != "${SSH_AUTH_SOCK}" ]; then
        # Exceptions: only do this if SSH_AUTH_SOCK isn't a symilnk or it is but doesn't point to _ORIGINAL_SSH_AUTH_SOCK.
        if [ ! -L "${SSH_AUTH_SOCK}" -o "$(readlink \"${SSH_AUTH_SOCK}\")" != "${_ORIGINAL_SSH_AUTH_SOCK}" ]; then
            candidates=( "${candidates[@]}" "${_ORIGINAL_SSH_AUTH_SOCK}" )
        fi
    fi

    # Candidate 1: SSH_AUTH_SOCK, if it is not a symilnk.
    # Rationale: If this command is being run for the first time, then a new SSH_AUTH_SOCK candidate is available.
    if [ -e "${SSH_AUTH_SOCK}" -a ! -L "${SSH_AUTH_SOCK}" ]; then
        candidates=( "${candidates[@]}" "${SSH_AUTH_SOCK}" )
    fi

    # Candidate 2: _STABLE_SSH_AUTH_SOCK, if it exists (i.e. the symlink points to a possibly-good socket.
    # Rationale: Fall back to doing nothing, or use the one that was hopefully already working.
    if [ -e "${_STABLE_SSH_AUTH_SOCK}" ]; then
        candidates=( "${candidates[@]}" "${_STABLE_SSH_AUTH_SOCK}" )
    fi

    if [ "${#candidates}" -eq 0 ]; then
        echo "fixup_ssh_auth_sock: no candidates :("
        return 2
    fi

    local found=0
    local candidate=
    for candidate in `ls -ct1 "${candidates[@]}" | head -n 1`; do
        local works=1
        #echo "Trying candidate: $candidate"
        export -f _bash_alarm
        bash --norc -c 'set -e; SSH_AUTH_SOCK=$1 _bash_alarm 5 ssh-add -l &>/dev/null' -- "${candidate}" || works=0
        if [ $works -eq 1 ]; then
            #echo "Found working socket: $candidate"
            if [ "${candidate}" != "${_STABLE_SSH_AUTH_SOCK}" ]; then
                ln -sf "${candidate}" "${_STABLE_SSH_AUTH_SOCK}"
            fi
            export SSH_AUTH_SOCK="${_STABLE_SSH_AUTH_SOCK}"
            found=1
            break
        fi
    done

    if [ $found -eq 0 ]; then
        echo "ERROR: Did not find a responding ssh-agent :("
        unset SSH_AUTH_SOCK
        return 2
    fi
}

function _bash_alarm() {
    local sleep_time_sec=$1
    shift
    (sleep ${sleep_time_sec}; kill -s SIGALRM $$) &
    local subshell=$!
    local exit_code=0
    "$@" || exit_code=$?
    kill $subshell || /bin/true
    exit ${exit_code}
}

fixup_ssh_auth_sock || /bin/true
