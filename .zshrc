
function _update_ps1()
{
	export PROMPT="$(~/powerline-zsh.py $?)"
    # source $ZSH/lib/completion.zsh
    # source "$ZSH/lib/history.zsh"
    # source "$ZSH/lib/key-bindings.zsh"
}

precmd()
{
	_update_ps1
}

alias ll='ls -alF'
alias la='ls -aF'
alias spoon4='bash ~/pdi-ee-client-4.4.3-GA/data-integration/spoon.sh'
