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

# The Fuck?
eval "$(thefuck --alias)"

# Zoxide init
eval "$(zoxide init zsh)"

# ============================================================================== #

export EDITOR=nvim
export DOTFILES="$HOME/.dotfiles"

# Spotifatius variables
export RSPOTIFY_CLIENT_ID=fbb59443f9ae488caecc97f898f607f5
export RSPOTIFY_CLIENT_SECRET=20f4c1a82aff44b19cb7469b33153e84

export OS3=/home/comodino/code/OS3-blog

# GPG variables
export GPG_TTY=$(tty)

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$OS3/src/restest:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

# ============================================================================== #

aurhelper="yay"

function in {

    local pkg="$1"
    
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

# ============================================================================== #

# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs

alias updb='sudo updatedb'

alias bdiscord='~/.comoappimages/betterdiscord' # run betterdiscord
alias ida64='~/idafree-8.3/ida64' # ida-free

alias emacs='emacs -nw' # run emacs in terminal
alias ani-cli='ani-cli -N' # get next episode countdown
alias anishchk='shellcheck -s sh -o all -e 2250' # shellcheck flags used for https://github.com/pystardust/ani-cli

alias kat-ai='ollama run llama2-uncensored'
alias cmodules='cd /home/comodino/code/OS3-blog/test/server/server/modules'
alias flowmanager='cd $OS3/src/flowmanager ; yarn start'

# ============================================================================== #

# Keybindings
bindkey -s ^n "tmux-sessionizer\n"
bindkey -s ^g "git-sync\n"
bindkey -s ^f "nvim-find\n"

# ============================================================================== #

# Functions

# Function to print an ascii art (10 lines) of `stocazzo`
cosa\? () {
    echo "███████╗████████╗ ██████╗  ██████╗ █████╗ ███████╗███████╗ ██████╗  "
    echo "██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██╔══██╗╚══███╔╝╚══███╔╝██╔═══██╗ "
    echo "███████╗   ██║   ██║   ██║██║     ███████║  ███╔╝   ███╔╝ ██║   ██║ "
    echo "╚════██║   ██║   ██║   ██║██║     ██╔══██║ ███╔╝   ███╔╝  ██║   ██║ "
    echo "███████║   ██║   ╚██████╔╝╚██████╗██║  ██║███████╗███████╗╚██████╔╝ "
    echo "╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  "
}

ccompile () {

    gcc -o main $1 ; ./main ; rm main

}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
