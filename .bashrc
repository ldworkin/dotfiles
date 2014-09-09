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
. ~/.files/z.sh

# aliases
alias emacs="emacs -nw"
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias kearns='ssh -X ldworkin@kearnsgroup.cis.upenn.edu'
alias plat='ssh -X ldworkin@plat.cis.upenn.edu'
alias cis192='ssh cis192@eniac.seas.upenn.edu'
alias trading='cd ~/Desktop/trading; ssh -i lili.pem ldworkin@54.85.167.232'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/octave/3.8.0/bin:$PATH"
