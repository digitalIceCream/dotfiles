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
