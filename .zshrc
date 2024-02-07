# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Functions
source ~/.zsh_funcs

export EDITOR=nvim

# Spotifatius variables
export RSPOTIFY_CLIENT_ID=fbb59443f9ae488caecc97f898f607f5
export RSPOTIFY_CLIENT_SECRET=20f4c1a82aff44b19cb7469b33153e84

# GPG variables
export GPG_TTY=$(tty)

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {

    local pkg="$1"
    
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs

alias bdiscord='~/.comoappimages/betterdiscord' # run betterdiscord

alias emacs='emacs -nw' # run emacs in terminal

# Keybindings
bindkey -s ^n "tmux-sessionizer\n"
bindkey -s ^g "git-sync\n"
bindkey -s ^f "nvim-find\n"

# Functions
cx () {
    cd $1 ; l;
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
