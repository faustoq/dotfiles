#!/bin/zsh

[ -f ~/.bash_profile ] && source ~/.bash_profile
[ -f ~/.bash_profile_custom ] && source ~/.bash_profile_custom

# Remove broken Homebrew completion symlinks that make compinit fail.
if [ -L "/opt/homebrew/share/zsh/site-functions/_brew_services" ] && \
  [ ! -e "/opt/homebrew/share/zsh/site-functions/_brew_services" ]; then
  rm -f "/opt/homebrew/share/zsh/site-functions/_brew_services"
fi
if [ -L "/usr/local/share/zsh/site-functions/_brew_services" ] && \
  [ ! -e "/usr/local/share/zsh/site-functions/_brew_services" ]; then
  rm -f "/usr/local/share/zsh/site-functions/_brew_services"
fi

# Reset stale zsh completion cache if Homebrew completion files changed.
if [ -f "${HOME}/.zcompdump" ] && \
  grep -q "_brew_services" "${HOME}/.zcompdump" && \
  [ ! -f "/opt/homebrew/share/zsh/site-functions/_brew_services" ]; then
  rm -f "${HOME}/.zcompdump" "${HOME}/.zcompdump.zwc"
fi

# Oh My Zsh
export ZSH=~/.oh-my-zsh
export DISABLE_AUTO_UPDATE="true"
export DISABLE_UPDATE_PROMPT="true"
export ZSH_COMPDUMP="${HOME}/.zcompdump-${ZSH_VERSION}"
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi

if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x "/usr/local/bin/brew" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# NVM and bash auto completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Java Env
export PATH="$HOME/.jenv/bin:$PATH"
if command -v jenv >/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# Android SDK and Emulator
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# pnpm
export PNPM_HOME="/Users/fausto/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# DENO
export DENO_INSTALL="/Users/fausto/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# DuckDB
export PATH='/Users/fausto/.duckdb/cli/latest':$PATH
