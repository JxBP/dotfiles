RST="%F{reset_color}%b"
GREEN="%F{green}"
CYAN="%F{cyan}"
BLUE="%F{blue}"
YEL="%F{yellow}"
RED="%F{red}"

# export PROMPT="$RED(%B$BLUE%~%b$RED)$RST "
# export PROMPT="%B$YEL%m$RST:${RED}[${BLUE}%n${RED}]$RST:${BLUE}%~$YEL$ $RST"
export PROMPT="${GREEN}%n@%m${RST}:${BLUE}%~${RST}$ "
# export PROMPT="%n@%m ${CYAN}%~ ${RST}$ "
# export PROMPT="[%n@%m %~]\$ "
