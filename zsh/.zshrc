bindkey -e

append_path() {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path $HOME/.local/bin/
append_path $HOME/.config/emacs/bin

alias ls='exa -lg'
alias la='exa -la'
# alias cd='z'
alias grep='rg'
alias cat='bat -p'
alias vvim='/usr/bin/vim'
alias vi='/usr/bin/nvim +ToggleFormatOnSave'
alias vim='/usr/bin/nvim'
alias neovide='/usr/bin/neovide --multigrid --frame none --maximized'
alias emacs="emacs -nw" # -nw = no-window (use a tui instead of an X window)
alias rm='rm -v'
alias ssh='TERM=xterm-256color ssh'
alias icat="wezterm imgcat"
alias mount_onedrive="rclone mount OneDrive:/ $HOME/Documents/Schule/OneDrive --vfs-cache-mode full"
alias mount_schule="rclone mount OneDrive:/Schule/Q11 $HOME/Documents/Schule/Q11 --vfs-cache-mode full"
alias ferris_rdp="xfreerdp '/u:ferris' /v:192.168.5.149 /w:1920 /h:1060"
alias gdb="gdb -n -x ${XDG_CONFIG_HOME}/gdb/init"
alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"
alias serve="python3 -m http.server"

function print_ip {
    ip -j addr show wlan0 | jq ".[0].addr_info[0].local" -r
}

# PS1 prompt
# eval $(starship init zsh)
# export PROMPT="[%n@%m %~]\$ "
export PROMPT="%~$ "

function alt_prompt {
    RESET="%{$reset_color%}"
    GREEN="%{$fg[green]%}"
    CYAN="%{$fg[cyan]%}"
    export PROMPT="%n@%m ${CYAN}%~ ${RESET}$ "
}

eval "$(zoxide init zsh)"
bindkey -s '^j' 'ls^M'

. "${CARGO_HOME}/env"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Managed by pacman (at least on Artix Linux)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

zi snippet OMZP::colored-man-pages
zinit load zdharma-continuum/history-search-multi-word
zinit load zsh-users/zsh-completions

autoload -U compinit && compinit

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select
