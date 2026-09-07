if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for config_file in "$HOME/.zshfiles/"*.zsh; do
  [ -r "$config_file" ] && source "$config_file"
done


ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf zsh-autosuggestions fzf-tab oc kubectx)

source $ZSH/oh-my-zsh.sh
source "/opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"


# Enable vim mode
bindkey -v


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#source ~/.zshrc.d/*.zsh
#fortune | cowsay -r | lolcat

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
for f in ~/.zshrc.d/*.zsh(.N); do; source "$f"; done
