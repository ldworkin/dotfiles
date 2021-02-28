# reload by: . ~/.zshrc

# ls after cd
function cd() { 
    builtin cd "$@" && ls; 
}

# https://github.com/rupa/z
. ~/z.sh

# aliases
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias python="/usr/bin/python3"
alias pip="/usr/bin/pip3"

export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
