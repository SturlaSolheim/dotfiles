if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/local.husbanken.no/hdst/tools"

export GIT_EDITOR=nvim

ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(git fzf zsh-autosuggestions fzf-tab oc)

source $ZSH/oh-my-zsh.sh

# ALIASER
alias dc="docker compose"
alias up="sudo dnf up -y"
alias mockdata="dc stop mockdata && dc build mockdata && dc up -d"
alias ls="eza"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
