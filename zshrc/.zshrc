
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/local.husbanken.no/hdst/tools"
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export GIT_EDITOR=nvim
export EDITOR=nvim
export GHOSTTY_RESOURCES=~/.config/ghostty/themes

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf zsh-autosuggestions fzf-tab oc kubectx)

source $ZSH/oh-my-zsh.sh
source "/opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"

# ALIASER
alias dc="docker compose"
alias up="brew update && brew upgrade"
alias mockdata="dc stop mockdata && dc build mockdata && dc up -d"
alias ls="eza"
alias vim="nvim"
alias lg="lazygit"
alias ld="lazydocker"
alias nxdw="sudo darwin-rebuild switch --flake ~/nix"
alias dagens="~/scripts/dagligNotat.sh"
alias q!="exit"
alias rundev="mvn spring-boot:run -Dspring-boot.run.profiles=dev"
alias dot="~/dotfiles/stow-dotfiles.sh"
alias signal="~/Nedlastinger/gurk"


# Enable vim mode
bindkey -v

# Reduce the delay when switching modes (default is 0.4s)
export KEYTIMEOUT=1

# Velg bilde fra ImageStream og sett det på en deployment
oc-deploy-image() {
  local deployment=$(oc get deploymentconfigs.apps.openshift.io -o name | fzf --header="Velg Deployment")
  local image=$(oc get is -o custom-columns=NAME:.metadata.name,TAGS:.status.tags[*].tag --no-headers | fzf --header="Velg Image:Tag" | awk '{print $1":"$2}')
  
  if [ -n "$deployment" ] && [ -n "$image" ]; then
    echo "Updater $deployment til $image..."
    oc set image $deployment *= $image
  fi
}

# Show vim mode in your prompt (optional)
# This updates the prompt to show INSERT or NORMAL mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Yazi config
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


source ~/.zshrc.d/*.zsh
fortune | cowsay -r | lolcat

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
