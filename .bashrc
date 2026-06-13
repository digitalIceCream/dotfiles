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
## rebind find file to CTRL+F and unbind default CTRL+T
bind -x '"\C-f": "fzf-file-widget"'
bind '"\C-t": ""'
## CTRL-O to fuzzy file find and open with xdg-open
bind '"\C-o": "fzf-open\n"'

# Terminal welcome message
echo ""
echo "  fzf shortcuts:"
echo "  Ctrl+R    fuzzy history search"
echo "  Ctrl+F    fuzzy file find, paste path"
echo "  Ctrl+O    fuzzy file find, open with xdg-open"
echo "  Alt+C     fuzzy cd into directory"
echo "  Meta+Shift+V    clipboard history"
echo ""
