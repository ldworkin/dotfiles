# reload by: . ~/.bashrc

# pretty colored prompt
N='\[\e[0m\]'
B='\[\e[00;36m\]'
R='\[\e[00;35m\]'
G='\[\e[00;32m\]'
export PS1="${B}\u${N}@${G}\h${N}:${R}\w${N}\$ "

# ls after cd
function cd() { 
    builtin cd "$@" && ls; 
}

# https://github.com/rupa/z
. ~/z.sh

# aliases
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

