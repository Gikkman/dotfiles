function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '%#'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function wrap_git_prompt_status {
    GPS=$(git_prompt_status);
    echo ${GPS:+%{$reset_color%}\[$GPS%{$reset_color%}\]}
}

PROMPT='
$FG[007][%D{%H:%M:%S}] %{$fg_bold[cyan]%}%n%{$reset_color%}@%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)$(wrap_git_prompt_status)
$(virtualenv_info)$FX[reset]$(prompt_char) '

# Default values for the appearance of the prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%} on %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%%{$fg[blue]%}↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg_bold[red]%}⚑"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[white]%}➤"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[magenta]%}?"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[yellow]%}$"

# display exitcode on the right when >0
return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
RPROMPT='${return_code}%{$reset_color%}'