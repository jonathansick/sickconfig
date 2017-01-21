# vi bindings
#
# https://dougblack.io/words/zsh-vi-mode.html

# vi-mode
bindkey -v

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# Note, the right prompt is now being set here, rather than in jsick_vcs_info
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg[red]%} [% NORMAL]%  %{$reset_color%}"
    RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} %{$fg[blue]%}$(virtualenv_info)%{$fg[yellow]%}%n@%m %~%{$reset_color%} %(?..%{$fg[red]%}%? ↵%{$reset_color%})"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1
