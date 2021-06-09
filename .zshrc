if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

export NVM_DIR=~/.nvm
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH

source $(brew --prefix nvm)/nvm.sh
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}+"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}!"
zstyle ':vcs_info:*' formats "%F{red}(%b)%c%u%f "
zstyle ':vcs_info:*' actionformats '%b|%a '
precmd () { vcs_info }
PROMPT='%F{cyan}%n%f%F{white}@%m%f %F{green}%~%f %F{red}$vcs_info_msg_0_%f%F{yellow}$%f '

alias ls='ls -FG'
alias ll='ls -ahlFG'
alias v='nvim'
alias g='git'
alias ggrep='grep -r --exclude-dir={node_modules,.webpack}'
