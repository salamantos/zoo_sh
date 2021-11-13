ANIMALS=("🐕" "🐑" "🐎" "🐁" "🐂" "🐅" "🐌" "🐍" "🐋")

function get_animal() {
    random=$(LC_ALL=C tr -dc 0-9 < /dev/urandom | head -c4)
    echo "${ANIMALS[@]:$((random % ${#ANIMALS[@]})):1}"
}

local prompt_symbol="%(?:%{$fg_bold[green]%}❯ :%{$fg_bold[red]%}❯"

local path_string="%F{cyan}%~"

local time="%F{#adadad}%*"

PROMPT='$(get_animal) ${prompt_symbol} '
RPROMPT='${path_string} $(git_prompt_info)${time}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

