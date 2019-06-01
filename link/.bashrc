 # Add user bin
export PATH="${HOME}/.bin:$PATH"

# Source
for DOTFILE in `find $HOME/.dotfiles/source`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done

# Terminal style
reset="\e[0m";
black="\e[1;30m";
blue="\e[1;34m";
cyan="\e[1;36m";
green="\e[1;32m";
orange="\e[1;33m";
purple="\e[1;35m";
red="\e[1;31m";
violet="\e[1;35m";
white="\e[1;37m";
yellow="\e[0;33m";
export CLICOLOR=1

# Terminal status line
PS1="# \[\033[1;36m\]\d - \[\033[0;32m\][\t] \[\033[1;36m\]\u\[\033[0m\]@\[\033[0;35m\]\w\[\033[0m\]";
PS1+="\$(prompt_git \"\[${white}\] on \[${yellow}\]\" \"\[${red}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${reset}\]"; # Reset colors
export PS1;

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
export LSCOLORS=dxfxcxdxbxegedabagacad