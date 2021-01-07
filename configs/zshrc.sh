[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -f ~/.bash_profile_custom ] && source ~/.bash_profile_custom

export ZSH=~/.oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

