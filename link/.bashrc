export DOTDIR="${HOME}/.dotfiles"
export PATH="${DOTDIR}/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export CLICOLOR=1

# Source all files from source
for file in `find $DOTDIR/source -depth 1 -type f`; do 
  source ${file}; 
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
PS1+="\$(sh ${DOTDIR}/util/git-prompt.sh \"\[${white}\] on \[${yellow}\]\" \"\[${red}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${reset}\]"; # Reset colors
export PS1;

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
export LS_COLORS='di=1;33:ln=1;35:ex=0;31:pi=0;47:so=0;47:bd=0;47;cd=0;47:or=0;44:mi=0;44'

