#
# ~/.bash_profile
#
[[ -f $HOME/.config/bash/.bashrc ]] && . ~/.config/bash/.bashrc


#source /home/jake/.config/broot/launcher/bash/br
export PATH="$PATH:$HOME/.cargo/bin/:$HOME/.cabal/bin/:$HOME/.local/bin:$HOME/.local/sysfetch:$HOME/.local/programs:$HOME/.local/todo.sh:$HOME/.local/scripts:$HOME/.local/scripts/dmenu:$HOME/.local/share/programs/vpm"
export CDPATH=.:$HOME:$HOME/.config/:$HOME/.local/:$HOME/.local/share/:$HOME/.local/share/programs


. "$HOME/.cargo/env"
