# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export SCRIPTS="$HOME/.local/scripts"
export CODE="$HOME/code"

export EDITOR=nvim

ZSH_THEME="robbyrussell"

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# Functions
source $HOME/.zsh_funcs
source $HOME/.fzf_zsh

# fzf git integration
source $SCRIPTS/fzf-git.sh

# The Fuck?
eval "$(thefuck --alias)"

# Zoxide init
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"

# ============================================================================== #

# GPG variables
export GPG_TTY=$(tty)

export PATH="$HOME/.local/bin:$PATH"
export PATH="$CODE/restest:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

# Ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

# ============================================================================== #

alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs

alias cm='ncmpcpp' # CLI music player

alias updb='sudo updatedb'

alias bdiscord='$HOME/.comoappimages/bdiscord' # run betterdiscord
alias ida64='$HOME/idafree-8.3/ida64' # ida-free
alias emacs='emacs -nw' # run emacs in terminal
alias kat-ai='ollama run llama2-uncensored'

# sadly, your time has come too my friend (rip neofetch)
# t the very least I will remember you for as long as I live
alias neofetch='fastfetch'

# ============================================================================== #

# Keybindings
bindkey -s ^n "tmux-sessionizer\n"
bindkey -s ^g "git-sync\n"
bindkey -s ^f "nvim-find\n"

# ============================================================================== #

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/home/comodino/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
