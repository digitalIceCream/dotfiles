#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'

function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}
