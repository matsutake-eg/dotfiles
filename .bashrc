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
export PS1='\[\033[37m\][\[\033[36m\]\u\[\033[37m\]@\h \[\033[32m\]\W\[\033[37m\]]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

alias ls='ls -FG'
alias ll='ls -ahlFG'
alias v='vim'
alias g='git'
alias ggrep='grep -r --exclude-dir={node_modules,.webpack}'
