 xset r rate 250 30
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
export PATH="$PATH:/home/coder/.local/share/bin"

# Path to powerlevel10k theme
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="robbyrussell"
# List of plugins used
plugins=(git)
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

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
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
alias clean="sh ~/.local/share/bin/cleanup.sh"
alias wifi="sh ~/.local/share/bin/wifimenu.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
