# add to .bashrc and uncomment
#if [ -f ~/.bash_aliases ]; then
#	source ~/.bash_aliases
#fi

# some qol-OpenSuse-style aliases

alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'

alias md='mkdir -p'

alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -lahFi'
alias ff='clear; fastfetch'

PS1="\[\e[0m\]\[\e[0;32m\][\u]\[\e[0m\] @ \[\e[0;36m\][\h]\[\e[0m\] in \[\e[0;34m\][\w]\[\e[0m\]\n\[\e[0;32m\]$\[\e[0m\] "


