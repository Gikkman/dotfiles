function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '%#'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function wrap_git_prompt_status {
    GPS=$(git_prompt_status);
    echo ${GPS:+$FX[reset]\[$GPS$FX[reset]\]}
}

# Colors (Spectrum)
# 027 - Blue
# 034 - Green
# 038 - Cyan
# 136 - Yellow
# 160 - Red
# 164 - Magenta
# 232 - Black
# 244 - Gray
# 255 - White

PROMPT='
$FG[244][%D{%H:%M:%S}] $FG[038]$FX[bold]%n$FX[reset]@$FG[034]$FX[bold]%~$FX[reset]$(git_prompt_info)$(wrap_git_prompt_status)
$(virtualenv_info)$FX[reset]$(prompt_char) '

# Default values for the appearance of the prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="$FX[reset] on $FG[136]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FX[reset] "

ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $FG[034]$FX[bold]√"

ZSH_THEME_GIT_PROMPT_AHEAD="$FG[034]▲"
ZSH_THEME_GIT_PROMPT_BEHIND="$FG[027]▼"
ZSH_THEME_GIT_PROMPT_DIVERGED="$FG[160]⚑"

ZSH_THEME_GIT_PROMPT_ADDED="$FG[034]$FX[bold]+$FX[reset]"
ZSH_THEME_GIT_PROMPT_MODIFIED="$FG[027]$FX[bold]Δ$FX[reset]"
ZSH_THEME_GIT_PROMPT_DELETED="$FG[160]$FX[bold]-$FX[reset]"
ZSH_THEME_GIT_PROMPT_RENAMED="$FG[255]❯"
ZSH_THEME_GIT_PROMPT_UNMERGED="$FG[136]="
ZSH_THEME_GIT_PROMPT_UNTRACKED="$FG[164]$FX[bold]?$FX[reset]"
ZSH_THEME_GIT_PROMPT_STASHED="$FG[136]$"

# display exitcode on the right when >0
return_code="%(?..$FG[160]%? ↵$FX[reset])"
RPROMPT='${return_code}$FX[reset]'