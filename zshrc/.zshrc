if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oppset for å dele configen i flere sider
for config_file in "$HOME/.zshfiles/"*.zsh; do
  [ -r "$config_file" ] && source "$config_file"
done


zstyle ':omz:update' cooldown 5

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf zsh-autosuggestions fzf-tab oc kubectx)

source $ZSH/oh-my-zsh.sh

# Dynamically finds the correct fzf-tab path on both macOS and Linux
if command -v brew &>/dev/null; then
  source "$(brew --prefix)/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
fi

# Enable vim mode
bindkey -v


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
for f in ~/.zshrc.d/*.zsh(.N); do; source "$f"; done
