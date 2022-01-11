zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-/]=** r:|=** l:|=*'
zstyle :compinstall filename '/home/nacro90/.zshrc'

autoload -Uz compinit
compinit

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

[ ! -d "$XDG_DATA_HOME/zsh" ] && mkdir -p "$XDG_DATA_HOME/zsh"
HISTFILE=~/.local/share/zsh/histfile
SAVEHIST=1000000
HISTSIZE="$SAVEHIST"

setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt GLOBDOTS             # Glob dots without typing (.)
setopt INC_APPEND_HISTORY   # Increment history as soon as command has entered
setopt NOTIFY               # Notify jobs
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt EXTENDED_GLOB
setopt GLOB_STAR_SHORT      # **/*.sh -> **.sh
setopt COMPLETE_IN_WORD
unsetopt MENU_COMPLETE
unsetopt FLOW_CONTROL       # Disable ^S for suspend

bindkey -v
bindkey -v '^p' history-search-backward
bindkey -v '^n' history-search-forward
bindkey -a '^p' history-search-backward
bindkey -a '^n' history-search-forward
bindkey -v '^k' autosuggest-accept
bindkey -a '^k' autosuggest-accept
bindkey -a Y vi-yank-eol

autoload edit-command-line
zle -N edit-command-line
bindkey -v '^e' edit-command-line
bindkey -a '^e' edit-command-line

zle_highlight=('paste:none')

function mkcd {
	mkdir "$1" && cd "$1"
}

function has {
	type "$1" > /dev/null
}

if has antibody; then
	source <(antibody init)
	antibody bundle < ~/.zsh_plugins.txt
else
  echo 'antibody not found'
fi

alias la='ls -la'
alias dust='dust -b'
alias cal='cal -m'

alias -g L='| less -R'

os_starship="$XDG_CONFIG_HOME/starship/$(uname).toml"
[ -f "$os_starship" ] && export STARSHIP_CONFIG="$os_starship"

has zoxide && eval "$(zoxide init zsh --cmd cd)"
has starship && eval "$(starship init zsh)"
has pyenv && eval "$(pyenv init -)"
has exa && alias ls='exa --color=always'

export FZF_DEFAULT_OPTS="--color=16 --reverse --info=inline --marker='* ' --bind=change:top --bind=ctrl-b:page-up --bind=ctrl-f:page-down --bind=ctrl-u:half-page-up --bind=ctrl-d:half-page-down"
export FZF_CTRL_R_OPTS='--no-info --preview='

alias ordot="/usr/bin/git --git-dir=$HOME/.ordot/ --work-tree=$HOME"

path+=("/usr/local/bin")
[ -d "$HOME/bin" ] && path+=("$HOME/bin")
[ -d "$HOME/.local/bin" ] && path+=("$HOME/.local/bin")

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

export EDITOR=nvim
# [ -n "$NVIM_LISTEN_ADDRESS" ] && export EDITOR=nvr-launcher || export EDITOR=nvim

export TERMINAL=alacritty

export PYENV_ROOT="$HOME/.pyenv"
path+=("$PYENV_ROOT/bin")
has pyenv && eval "$(pyenv init --path)"

export PATH

os_zshrc="$HOME/.zshrc-$(uname)"
[ -f "$os_zshrc" ] && source "$os_zshrc"

pfetch 2> /dev/null
