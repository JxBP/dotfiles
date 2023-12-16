export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Make programs use XDG directories
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GHCUP_USE_XDG_DIRS=1
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GDBHISTFILE="$XDG_CONFIG_HOME/gdb/.gdb_history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite_history"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export OPAMROOT="$XDG_DATA_HOME/opam"
export ANDROID_HOME="$XDG_DATA_HOME/android"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export LEIN_HOME="$XDG_DATA_HOME/lein"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg" - See arch wiki note

export EXA_COLORS=$(vivid generate molokai)
export LC_ALL=en_US.UTF-8
export EDITOR='nvim'
export GPG_TTY=$(tty)
export NVM_SYMLINK_CURRENT=true
export CHROME_EXECUTABLE="$(which chromium)"
export PATH="$PATH:$HOME/.local/bin/:$HOME/.config/emacs/bin:$XDG_DATA_HOME/flutter/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$HOME/.local/share/bob/nvim-bin"
export RUSTC_WRAPPER=sccache
export PINENTRY_USER_DATA="MODE=TUI" # See $DOTFILES/bin/my-pinentry

export LESSHISTFILE=/dev/null
export NODE_REPL_HISTORY=''

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=1000
export SAVEHIST=1000
export setopt appendhistory

export DOTFILES="$HOME/dotfiles"
export PATH="$PATH:$HOME/dotfiles/bin"
