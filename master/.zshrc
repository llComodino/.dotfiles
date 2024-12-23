# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export SCRIPTS="$HOME/.local/scripts"
export CODE="$HOME/code"
export OS3="$HOME/os3"
export COMOMUSIC="$HOME/comomusic"
export XDG_CONFIG_HOME="$HOME/.config"

# ROCM + HIP
export HSA_OVERRIDE_GFX_VERSION=10.3.0
export ROCM_PATH=/opt/rocm
export HIP_PATH=/opt/rocm/hip
export PATH=$PATH:$ROCM_PATH/bin:$HIP_PATH/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROCM_PATH/lib

# ~!IMPERATIVE!~ #
export EDITOR=nvim
# ~!IMPERATIVE!~ #
export MANPAGER="nvim +Man!"

ZSH_THEME="como-russel" # set by `omz`

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting asdf )

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Functions
source $HOME/.zsh_funcs
source $HOME/.fzsh
source $HOME/.zsh_aliases

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
export PATH="$HOME/.local/bin/arango/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

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

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
