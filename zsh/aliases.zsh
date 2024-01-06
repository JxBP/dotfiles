alias bulk_rename='/bin/ls | renamer'
alias cat='bat -p'
# alias cd='z'
alias ferris_rdp="xfreerdp '/u:ferris' /v:192.168.5.149 /w:1920 /h:1060"
alias gdb="gdb -n -x ${XDG_CONFIG_HOME}/gdb/init"
alias grep='rg'
alias icat="wezterm imgcat"
alias la='eza -lFHa'
alias ls='eza -lFHg'
alias mount_htb="sshfs alma@192.168.122.209:htb $HOME/htb"
alias mount_onedrive="rclone mount OneDrive:/ $HOME/Documents/Schule/OneDrive --vfs-cache-mode full"
alias mount_schule="rclone mount OneDrive:/Schule/Q12 $HOME/Documents/Schule/Q12 --vfs-cache-mode full"
alias neovide='/usr/bin/neovide --multigrid --frame none --maximized'
alias serve="python3 -m http.server"
alias ssh='TERM=xterm-256color ssh'
alias vim='nvim'
alias vi='nvim +ToggleFormatOnSave'
alias vvim='vim'
alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias xinstall="doas xbps-install -S"
alias xquery="xbps-query -Rs"
alias xremove="doas xbps-remove -R"
alias xupdate="doas xbps-install -Su"
