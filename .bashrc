if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

export NVM_DIR=~/.nvm
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH

source $(brew --prefix nvm)/nvm.sh
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
 source /usr/local/etc/bash_completion.d/git-completion.bash
 __git_complete g __git_main
fi
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
 source /usr/local/etc/bash_completion.d/git-prompt.sh
fi
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='\[\e[37m\]\t\[\e[0m\] \[\e[36m\]\u\[\e[0m\]\[\e[37m\]@\h\[\e[0m\] \[\e[32m\]\W\[\e[0m\]\[\e[31m\]$(__git_ps1)\[\e[0m\] \$ '

alias ls='ls -FG'
alias ll='ls -ahlFG'
alias v='vim'
alias g='git'
alias ggrep='grep -r --exclude-dir={node_modules,.webpack}'
