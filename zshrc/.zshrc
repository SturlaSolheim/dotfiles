if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/local.husbanken.no/hdst/tools"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export GIT_EDITOR=nvim
export EDITOR=nvim
export GHOSTTY_RESOURCES=~/.config/ghostty/themes

ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(git fzf zsh-autosuggestions fzf-tab oc)

source $ZSH/oh-my-zsh.sh

# ALIASER
alias dc="docker compose"
alias up="sudo dnf up -y"
alias mockdata="dc stop mockdata && dc build mockdata && dc up -d"
alias ls="eza"
alias vim="nvim"


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
