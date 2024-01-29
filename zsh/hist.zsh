export HISTSIZE=50000
export SAVEHIST=50000

setopt INC_APPEND_HISTORY       # immediately append to history file
setopt EXTENDED_HISTORY         # record timestamp in history
setopt HIST_EXPIRE_DUPS_FIRST   # expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS         # dont record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS     # delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS        # do not display a line previously found
setopt HIST_IGNORE_SPACE        # dont record an entry starting with a space
setopt HIST_SAVE_NO_DUPS        # dont write duplicate entries in the history file
setopt SHARE_HISTORY            # share history between all sessions

