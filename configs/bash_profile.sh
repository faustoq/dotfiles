#!/bin/bash

export PAGER=less
export EDITOR=nano
export BROWSER=chrome 
export MPLAYER=vlc

export LANG=en                                  # The basic language setting used by applications on the system
export LC_ALL=en_US.UTF-8                       # This variable serves as a powerful override over all the other locale environment variables.
export LC_CTYPE=UTF-8                           # The character set used to display and input text
export HOMEBREW_NO_ANALYTICS=1                  # Tell to brew to not collect analytics data
export HOMEBREW_NO_AUTO_UPDATE=true             # Tell to brew to not auto-update before brew intsall
export NVM_DIR=~/.nvm                           # NVM
export PATH="$PATH:$HOME/.composer/vendor/bin"  # Composer
export BREW_PATH=/usr/local                     # $(brew --prefix)
export ZSH_THEME="agnoster"                     # ZSH Theme 
export ZSH_AUTOSUGGEST_USE_ASYNC=1              # ZSH async auto-suggestions
export DEFAULT_USER=$USER                       # Default User

source /opt/homebrew/share/antigen/antigen.zsh

# Google Cloud SDK
# export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# ZSH things
OHMYZSH_PLUGINS=(
autojump # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autojump
last-working-dir # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/last-working-dir
bgnotify # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bgnotify
zsh-users/zsh-completions # https://github.com/zsh-users/zsh-completions
zsh-users/zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting # https://github.com/zsh-users/zsh-syntax-highlighting
)

# Setup antigen
[ -f /usr/local/share/antigen/antigen.zsh ] && source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
for plugin in "${OHMYZSH_PLUGINS[@]}"; do
  antigen bundle "$plugin"
done

antigen apply

# Syntactic sugar aliases
alias please='sudo'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-debug="chrome --remote-debugging-port=9222"
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias md5sum="md5"
alias sha1sum="shasum"

# Recursively remove all node modules
alias rm-nm="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"

# Git Aliases
alias push="git push"
alias pull="git pull"
alias fetch="git fetch"
alias commit="git commit"
alias rebase="git rebase"
alias master="git checkout master && git pull origin master"
alias stash="git stash"
alias checkout="git checkout"
alias sync-upstream="git fetch --all --prune && git switch main && git merge upstream/main"

# Common alias
alias l='ls -lFh'     # size, show type, human readable
alias la='ls -lAFh'   # long list, show almost all, show type, human readable
alias lr='ls -tRFh'   # sorted by date, recursive, show type, human readable
alias lt='ls -ltFh'   # long list, sorted by date, show type, human readable
alias ll='ls -l'      # long list
alias lla='ls -la'    # long list (all files)
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='${=EDITOR} ~/.zshrc'
alias bashprof='${=EDITOR} ~/.bash_profile'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# List whats inside packed file
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

# Laravel Sail
alias sail='bash vendor/bin/sail'

# Open the current directory in a Finder window
finder() {
  open_command "$PWD"
}

# Remove .DS_Store files recursively in a directory, default .
rmdsstore() {
	find "${@:-.}" -type f -name .DS_Store -delete
}
  
flush() {
  dscacheutil -flushcache && 
  killall -HUP mDNSResponder
}

docker-stop() {
  docker stop $(docker ps -aq)
}

docker-remove() {
  docker rm $(docker ps -aq)
}

upgrade() {
  brew update
  brew upgrade
  brew cask upgrade
  mas upgrade
}

ip() {
  ifconfig en0 | grep "inet " | cut -d " " -f 2
}

kill-port() {
  pid=$(lsof -n -i4TCP:$1 | awk '{print $2}' | tail -n 1)
  if [ -n "$pid" ]; then 
    echo "Killing PID: $pid"
    kill -9 "$pid"
  else 
    echo "No app running on port $1"
  fi
}

# NVM hook
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc

# Autoload completion
autoload -Uz compinit && compinit

# Setup external integrations
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -e ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh
# [ -s /usr/local/opt/nvm/nvm.sh ] && source /usr/local/opt/nvm/nvm.sh  # This loads nvm
# [ -s /usr/local/opt/nvm/etc/bash_completion.d/nvm ] && source /usr/local/opt/nvm/etc/bash_completion.d/nvm  # This loads nvm bash_completion
# [ -f /usr/local/bin/kubectl ] && source <(kubectl completion zsh)
# [ -f /usr/local/opt/zsh-git-prompt/zshrc.sh ] && source /usr/local/opt/zsh-git-prompt/zshrc.sh
# [ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
