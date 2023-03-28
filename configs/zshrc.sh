[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -f ~/.bash_profile_custom ] && source ~/.bash_profile_custom

# Oh My Zsh
export ZSH=~/.oh-my-zsh
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

eval $(/opt/homebrew/bin/brew shellenv)

# NVM and bash auto completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Java Env
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Android SDK and Emulator
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

