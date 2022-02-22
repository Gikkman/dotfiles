alias ..='cd ..'
alias ....='cd .. && cd ..'
alias ......='cd .. && cd .. && cd ..'

alias gp='git pull'
alias gc='git checkout'

if $(type gls > /dev/null); then
    alias ll="gls -lah --color=yes --group-directories-first"
else 
    alias ll="ls -lah --color=yes --group-directories-first"
fi