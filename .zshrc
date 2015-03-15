
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

source ~/.aliases
bindkey '[C' forward-word # alt + ->
bindkey '[D' backward-word # alt + <-
