# enable color support of ls and also add handy aliases
function setup_dircolors() {
    local have_dircolors=0
    local DIRCOLORS_BINS=( dircolors gdircolors ) # gdircolors on OS X
    local b=
    for b in "${DIRCOLORS_BINS[@]}"; do
        if [ -x "$(which $b 2>/dev/null)" ]; then
            test -r ~/.dircolors && eval "$($b -b ~/.dircolors)" || eval "$($b -b)"
            have_dircolors=1
            break
        fi
    done

    if [ $have_dircolors -ne 0 ]; then
        export GNU_PREFIX=
        if [ "$(uname)" == "Darwin" -a "$(which gls)" != "" ]; then
            GNU_PREFIX=g
        fi

        alias ls="$(echo ${GNU_PREFIX}ls) --color=auto"
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
        unset GNU_PREFIX
    fi
}
setup_dircolors

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
