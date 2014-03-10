# reload by: . ~/.bashrc

N='\[\e[0m\]'
B='\[\e[00;36m\]'
R='\[\e[00;35m\]'
G='\[\e[00;32m\]'
export PS1="${B}\u${N}@${G}\h${N}:${R}\w${N}\$ "

function cd() { 
	builtin cd "$@" && ls; 
}

. ~/.files/z.sh

alias emacs="emacs -nw"
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias killem="kill -9 `ps aux | grep Emacs | grep -v grep | awk '{print $2}'`"
alias kearns='ssh -X ldworkin@kearnsgroup.cis.upenn.edu'
alias plat='ssh -X ldworkin@plat.cis.upenn.edu'
alias cis192='ssh cis192@eniac.seas.upenn.edu'
alias acttion_ssh='ssh ldworkin_acttion@ssh.phx.nearlyfreespeech.net'
alias acttion_sftp='sftp ldworkin_acttion@ssh.phx.nearlyfreespeech.net'
alias immpact_sftp='sftp waterlili@01fc1f6.netsolhost.com'

