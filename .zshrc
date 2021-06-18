if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

export NVM_DIR=~/.nvm
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH

alias ls='ls -FG'
alias ll='ls -ahlFG'
alias v='nvim'
alias g='git'
alias ggrep='grep -r --exclude-dir={node_modules,.webpack}'

source $(brew --prefix nvm)/nvm.sh

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
setopt complete_in_word
zstyle ':completion:*:default' menu select=1
setopt list_packed
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}+"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}!"
zstyle ':vcs_info:*' formats "%F{red}%b%u%c%f "
zstyle ':vcs_info:*' actionformats '%b|%a '
### git: Show marker if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+="%F{magenta}?"
    fi
}
precmd () { vcs_info }

PROMPT='%F{cyan}%n%f%F{white}@%m%f %F{green}%~%f %F{red}$vcs_info_msg_0_%f%F{yellow}$%f '
