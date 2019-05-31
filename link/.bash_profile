alias ll='ls -la'
alias reload-alias='source ~/.bash_profile';
alias open-alias="open -a /Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text ~/.bash_profile &";
alias cip='mvn clean install package -DskipTests';

# Git branch in prompt.
prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='~';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}

# TERMINAL STYLE
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

# TERMINAL STATUS LINE
PS1="# \[\033[1;36m\]\d - \[\033[0;32m\][\t] \[\033[1;36m\]\u\[\033[0m\]@\[\033[0;35m\]\w\[\033[0m\]";
PS1+="\$(prompt_git \"\[${white}\] on \[${yellow}\]\" \"\[${red}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${reset}\]"; # Reset colors
export PS1;

#Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
export LSCOLORS=dxfxcxdxbxegedabagacad

export LOCALHOST_IP="$(ifconfig | sed -n -E 's/.*inet\ ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}).*/\1/p' | tail -1)"
export PATH="${HOME}/.bin:$PATH" # Add user bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

# JENV
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#Git - Enable for a custom terminal style
#source $(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh