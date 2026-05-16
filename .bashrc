# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# git bare for config, see github README
function config {
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

#
# fzf
## enable fzf integration

eval "$(fzf --bash)"

# Open file with xdg-open via fzf
fzf-open() {
    local file
    file=$(fzf --preview 'cat {}' 2>/dev/null)
    [ -n "$file" ] && xdg-open "$file"
}
bind '"\C-o": "fzf-open\n"'


# Own aliases here

alias python='python3'
alias dup='dup.sh'
alias dupoff='dupoff.sh'
alias btp='backup-to-pi.sh'
