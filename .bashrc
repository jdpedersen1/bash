#####---------- EXPORTS ----------###
export BROWSER="brave-browser-stable"
export EDITOR="nvim -u $HOME/.config/nvim/init.lua"
export VISUAL="nvim -u $HOME/.config/nvim/init.lua"
export MYVIMRC="$HOME/.config/vim/.vimrc"
export VIMINIT="source $MYVIMRC"
export LESSHISTFILE=-
export HISTFILE="$HOME/.config/bash/.bash_history"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=xcb
export HYPRSHOT_DIR="$HOME/Images/Pictures/Screenshots"
export INPUTRC=/home/jake/.config/bash/.inputrc
export GIT_CONFIG_GLOBAL=/home/jake/.config/git/gitconfig

source /home/jake/.config/bash/bash_aliases

###---------- SHELL OPTIONS -------###

shopt -s autocd

###---------- DECORATION ----------###

if [ "${TERM}" == xterm-256color ]; then
  \cat ~/.local/sysfetch/logo2
  printf "\e[1;37m|--------------------| \e[1;36mSys Info\e[1;37m |---------------------|\n"
  printf "                      ^^^^^^^^^^\n"
  \cat ~/.local/sysfetch/sysinfo.txt
  printf "\n\n"
  printf "|-----------------------------------------------------|\n\n"
elif [ "${TERM}" == xterm-kitty ]; then
  kitty +kitten icat --align left "${HOME}"/Images/mosh/photo1.gif
fi


###------------------- PROMPT -----------------------###

function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo "${STATUS}" | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo "${STATUS}" | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo "${STATUS}" | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo "${STATUS}" | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo "${STATUS}" | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo "${STATUS}" | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

prompt_comment() {
    DIR="$HOME/.local/share/promptcomments/"
    MESSAGE="$(find "$DIR"/*.txt | shuf -n1)"
    cat "$MESSAGE"
}

PS1="\[\e[1;31m\]\$(parse_git_branch)\[\033[34m\]\$(parse_git_dirty)\n\[\033[1;33m\]  \[\e[1;37m\] \w \[\e[1;36m\]\[\e[0;37m\] "


###---------- ARCHIVE EXTRACT ----------###

ex ()
{
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7za e x $1   ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    tar xf $1    ;;
        *.tar.zst)   unzstd $1    ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


### ---------- OTHER ----------###

HISTSIZE=10000
#SAVEHIST=10000

export LESS_TERMCAP_mb=$'\e[1;36m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[1;37m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;34m'

#eval "$(zoxide init bash)"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

. "$HOME/.cargo/env"
