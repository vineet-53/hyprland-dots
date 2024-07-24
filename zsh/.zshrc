# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh/
export PATH="/bin:$HOME/.local/share/bin:$PATH"
# export PATH="/bin:$PATH"
# Path to powerlevel10k theme
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# ZSH_THEME="robbyrussell"
eval "$(starship init zsh)"
# List of plugins used
plugins=(git sudo history encode64 copypath zsh-autosuggestions  zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
# alias vc='code' # gui code editor

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
#pokemon-colorscripts --no-title -r 1,3,6

# custom alias CUSTOM ALIAS
alias clones="cd ~/Downloads/clones"
alias si="sudo apt install "
alias m="mkdir "
#alias b="cd .."
alias comp="cd ~/Codes/cp"
alias dev="cd ~/Codes/Web-Development"
alias ml="cd ~/Codes/MachineLearning"
alias desk="cd ~/Desktop"
alias temp="cd ~/temp"
alias cls= "clear"
alias zconf="nvim ~/.zshrc"
alias zcompile="source ~/.zshrc"
alias activate="ml && source venv/bin/activate"
# alias t="tmux"
alias v="vim "
alias t="tmux "
alias n="nvim"
alias rconf="nvim ~/.local/share/bin/rofi-radio"
alias setw="swww img --transition-type=random "
alias inv="fzf --delimiter=' ' | nvim -f -"
alias ff='fzf --preview="bat --color=always {}"'
alias twd='alacritty --working-directory=$(pwd) & exit'
alias fd='fzf --walker=,dir'
alias fon='nvim $(ff)'
alias gd='cd $(fd)'
alias fhome='fzf --walker=,dir --walker-root=$HOME'
alias home='cd $(fhome)'
alias froot='fzf --walker=,dir --walker-root=/ --walker-skip=/home'
alias root='cd $(froot)'
alias fcodes='fzf --walker=,dir --walker-root=$HOME/Codes/'
alias codes='cd $(fcodes)'
alias vi="vim "
alias rmrs="sudo rm -r"
alias rmr="rm -r"
alias window="cd /mnt/window"
alias d="cd /mnt/drive"
alias e="cd /mnt/drive2"
alias vid="cd /mnt/drive2/Telegram/0-100Cohort/0-100Cohort"
alias set-timer="nvim ~/.config/waybar/config.jsonc"
alias ga="git add "
alias gc="git commit -m"
alias gr="git reset "
alias gs="git status "
alias server="npm run dev"
alias play="mpv --playlist=/mnt/drive/Telegram/LoveBabbar"
alias t="sh ~/.local/share/bin/smux.sh"
alias view="yazi "
alias vim="nvim "
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autopair
if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi

source ~/.zsh-autopair/autopair.zsh
autopair-init

