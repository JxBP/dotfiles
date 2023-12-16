# These are just configurations for the highlighting plugins
# The actual zinit invokation is in the .zshrc because it must
# be at the very end of the whole startup
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[command]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[commandseparator]='bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#777777'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#777777'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=green'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#fb4934'

