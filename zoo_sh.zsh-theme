ANIMALS=("🐕" "🐑" "🐎" "🐁" "🐂" "🐅" "🐌" "🐍" "🐋")

function get_animal() {
    random=$(LC_ALL=C tr -dc 0-9 < /dev/urandom | head -c4)
    echo "${ANIMALS[@]:$((random % ${#ANIMALS[@]})):1}"
}

local prompt_symbol="%{$reset_color%}%(?:%{$fg_bold[green]%}❯ :%{$fg_bold[red]%}❯%{$reset_color%}"

[[ $UID -eq 0 ]] && root_indicator="⚡ " || root_indicator=""
local path_string="%{$reset_color%}%F{cyan}%~%{$reset_color%}"

local time="%{$reset_color%}%F{#adadad}%*%{$reset_color%}"

PROMPT='$(get_animal) ${root_indicator}${prompt_symbol} '
RPROMPT='${path_string} $(git_prompt_info)${time}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

