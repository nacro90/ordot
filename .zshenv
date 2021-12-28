UNAME="$(uname)"

is_mac() {
  [ "Darwin" = "$UNAME" ]
}

is_linux() {
  [ "Linux" = "$UNAME" ]
}

PATH="/usr/local/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

source "$HOME/.cargo/env"

export SDKMAN_DIR="$HOME/.sdkman"

export GOPATH="$HOME/.golang"
export GOROOT='/usr/local/opt/go/libexec'
export GO111MODULE='on'
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export EDITOR=nvim
export TERMINAL=alacritty

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

if [ -e /Users/orcan.tiryakioglu/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/orcan.tiryakioglu/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export KUBECONFIG="$HOME/.kube/config"
