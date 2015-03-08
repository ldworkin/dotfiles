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

gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# https://github.com/rupa/z
. ~/z.sh

# aliases
alias emacs="emacs -nw"
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias kearns='ssh -X ldworkin@kearnsgroup.cis.upenn.edu'
alias plat='ssh -X ldworkin@plat.cis.upenn.edu'

