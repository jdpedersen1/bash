#####---------- EXPORTS ----------###

##- ENVIRONMENT VARIABLES -##

source $HOME/.config/bash/env_vars

##- ALIASES -##

source $HOME/.config/bash/bash_aliases

##- PROMPT -##

source $HOME/.config/bash/prompt


cd() {
  if [ -z "$1" ]; then
    builtin cd
  else
    builtin cd "$1" && la
  fi
}

###---------- SHELL OPTIONS -------###

shopt -s autocd

###---------- DECORATION ----------###

#if [ "${TERM}" == xterm-256color ]; then
#  \cat ~/.local/sysfetch/logo2
#  printf "\e[1;37m|--------------------| \e[1;36mSys Info\e[1;37m |---------------------|\n"
#  printf "                      ^^^^^^^^^^\n"
#  \cat ~/.local/sysfetch/sysinfo.txt
#  printf "\n\n"
#  printf "|-----------------------------------------------------|\n\n"
#elif [ "${TERM}" == xterm-kitty ]; then
#  kitty +kitten icat --align left "${HOME}"/Images/mosh/photo1.gif
#fi


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

export LESS_TERMCAP_mb=$'\e[1;33m'
export LESS_TERMCAP_md=$'\e[1;33m'
export LESS_TERMCAP_me=$'\e[1;37m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;34m'


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#. "$HOME/.cargo/env"
