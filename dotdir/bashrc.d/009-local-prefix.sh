if [ -e "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
else
    if [ -e "$HOME/prefix/bin" ]; then
        export PATH="$HOME/prefix/bin:$PATH"
    fi
fi

# For pip3
export PATH="$HOME/.local/bin:$PATH"
