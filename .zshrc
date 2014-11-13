function _update_ps1()
{
	export PROMPT="$(~/powerline-zsh.py $?)"
}

precmd()
{
	_update_ps1
}

alias ll='ls -alF'
alias la='ls -aF'
alias pdi='bash ~/pdi-ee-client-4.4.3-GA/data-integration/spoon.sh'

export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
export PATH=$PATH:$JAVA_HOME/bin
export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
