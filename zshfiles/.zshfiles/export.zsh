
export ZSH="$HOME/.oh-my-zsh"

if [[ $(uname) == "Darwin" ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
  export PATH="$HOME/bin:$PATH"
  export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
  [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
else
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export PATH="$PATH:$HOME/.local/share/yabridge"
  export PATH="$HOME/.local/wine-9.21-staging-tkg-amd64/bin:$PATH"
fi


export GIT_EDITOR=nvim
export EDITOR=nvim
export GHOSTTY_RESOURCES=~/.config/ghostty/themes
