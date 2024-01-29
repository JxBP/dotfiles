config_modules=(
    aliases
    zinit
    ps1
    highlighting
    hist
)

for mod in ${config_modules[@]}
do
    source "${ZDOTDIR}/${mod}.zsh"
done

bindkey -e
bindkey -s '^j' 'ls^M'

# See https://stackoverflow.com/questions/444951/zsh-stop-backward-kill-word-on-directory-delimiter
autoload -U select-word-style
select-word-style bash

fe() {
    file="$(fd . ${2:-.} | fzf-tmux --query="$1" --multi --select-1 --exit-0)"
    if [ $? -eq 0 ]; then
        ${EDITOR:-vim} "${file}"
    fi
}

fcd() {
    cd "$(fd . "${2:-.}" -t d | fzf-tmux --query="$1" --multi --select-1 --exit-0)"
}

show_ip() { ip -j addr show "${1:-wlan0}" | jq ".[0].addr_info[0].local" -r }

daemonize() {
    nohup zsh -c "$*" >/dev/null 2>/dev/null & disown
}

# Random crap I gotta initalize
. "${CARGO_HOME}/env"
[[ ! -r "$OPAMROOT/opam-init/init.zsh" ]] || source "$OPAMROOT/opam-init/init.zsh" > /dev/null 2> /dev/null
# eval "$(zoxide init zsh)"

# Why does it need to print them and why is there no "easy" way to silence them
# @.@
_SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
unset _JAVA_OPTIONS
alias java='java "$_SILENT_JAVA_OPTIONS"'

# Must be at the end of the entire config
zinit light zsh-users/zsh-syntax-highlighting
