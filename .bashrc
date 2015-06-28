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
   PIP_REQUIRE_VIRTUALENV="" sudo pip "$@"
}

# https://github.com/rupa/z
. ~/z.sh

# aliases
alias emacs="emacs -nw"
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias activate="source venv/bin/activate"
alias incandenza='ssh ldworkin@incandenza.seas.upenn.edu'
alias pemulis='ssh ldworkin@pemulis.seas.upenn.edu'
alias do='ssh lilidworkin@192.241.169.165'
alias nfs='ssh ldworkin_lilianne@ssh.phx.nearlyfreespeech.net'
