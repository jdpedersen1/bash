#####---------- EXPORTS ----------###
source /home/jake/.config/bash/env_vars
source /home/jake/.config/bash/bash_aliases
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

PYTHON_ICON="[  ] "  # Snake emoji for Python
RUST_ICON="\U1F680"    # Rocket emoji for Rust
BASH_ICON="[  ] "        # No icon for directories with multiple file types
HASKELL_ICON="[  ] "
JAVA_ICON="[  ] "
DEFAULT_ICON=""


# Function to determine directory file types
function set_prompt_icon() {
    # Get the file extensions in the current directory
    extensions=$(find . -maxdepth 1 -type f | sed -n 's/.*\.//p' | sort | uniq)

    # Count the number of unique file extensions
    count=$(echo "$extensions" | wc -l)

    # Check if there is only one type of file in the directory
    if [ "$count" -eq 1 ]; then
        case "$extensions" in
            py)
                echo -e "$PYTHON_ICON"
                ;;
            rs)
                echo -e "$RUST_ICON"
                ;;
            sh)
                echo -e "$BASH_ICON"
                ;;
            hs)
                echo -e "$HASKELL_ICON"
                ;;
            java)
                echo -e "$JAVA_ICON"

        esac
    else
        echo -e "$DEFAULT_ICON"
    fi
}

PS1="\[\e[1;31m\]\$(parse_git_branch)\[\033[34m\]\$(parse_git_dirty)\n\[\033[1;30m\]  \[\e[1;37m\] \w \[\e[1;33m\]\$(set_prompt_icon)󰅂\[\e[0;37m\] "


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


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#. "$HOME/.cargo/env"
