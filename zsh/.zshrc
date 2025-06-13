# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/zsh_history
HISTFILESIZE=100000
HISTSIZE=100000
SAVEHIST=100000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mani/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
# End of lines added by compinstall
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_VERIFY
alias ls='ls --color' 
alias rm='rm -i'
alias mv='mv -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias vim='nvim'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Edit line in vim buffer
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Use vim keys in tab autocomplete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/kitty
export HISTCONTROL=ignoreboth
export MANPAGER='nvim +Man!'
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# %3~ Displays cwd and shortens home path to ~, 3 tells zsh to only display 
# the last 3 directory names
# %# Changes % to # in current prompt, if current shell is root-shell
# %F{blue} Changes color of prompt
# %f Returns prompt color to white
# PROMPT='%F{blue}%3~%f %# '

# Init starship
eval "$(starship init zsh)"
