if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

alias ls='ls -FG'
alias ll='ls -ahlFG'
alias v='code'
alias nv='nvim'
alias g='git'
alias gg='git grep -n'

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
zstyle ':vcs_info:*' formats "%F{red}%b%m%u%c%f "
zstyle ':vcs_info:*' actionformats '%b|%a '
zstyle ':vcs_info:git*+set-message:*' hooks git-misc
+vi-git-misc(){
    local ahead behind
    local -a gitstatus

    # for git prior to 1.7
    # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
    (( $ahead )) && gitstatus+=( "%F{blue}<-${ahead}" )

    # for git prior to 1.7
    # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')
    (( $behind )) && gitstatus+=( "%F{blue}->${behind}" )

    hook_com[misc]+=${(j:/:)gitstatus}

    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+="%F{magenta}?"
    fi
}
precmd () { vcs_info }

PROMPT='%F{white}%D{%Y-%m-%dT%H:%M:%S+09:00}%f %F{cyan}%n%f%F{gray}@%m%f %F{green}%~%f %F{red}$vcs_info_msg_0_%f%F{yellow}$%f '
