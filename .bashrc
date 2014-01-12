# reload by: . ~/.bashrc

N='\[\e[0m\]'
B='\[\e[00;36m\]'
R='\[\e[00;35m\]'
G='\[\e[00;32m\]'
export PS1="${B}\u${N}@${G}\h${N}:${R}\w${N}\$ "
export AWS_ACCESS_KEY_ID=AKIAINM5YSST4VORXHXQ
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=us-west-2
export EDITOR=~/.emacs.d/edit

function cd() { 
	builtin cd "$@" && ls; 
}

alias emacs="emacs -nw"
alias Emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

alias kearns='ssh -X ldworkin@kearnsgroup.cis.upenn.edu'
alias cis192='ssh cis192@eniac.seas.upenn.edu'
alias acttion_ssh='ssh ldworkin_acttion@ssh.phx.nearlyfreespeech.net'
alias acttion_sftp='sftp ldworkin_acttion@ssh.phx.nearlyfreespeech.net'
alias immpact_sftp='sftp waterlili@01fc1f6.netsolhost.com'
# Wntrscmng317
