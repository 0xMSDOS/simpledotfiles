
# ███████████ █████  █████████  █████   █████
#░░███░░░░░░█░░███  ███░░░░░███░░███   ░░███ 
# ░███   █ ░  ░███ ░███    ░░░  ░███    ░███ 
# ░███████    ░███ ░░█████████  ░███████████       / By 0x-MsDos
# ░███░░░█    ░███  ░░░░░░░░███ ░███░░░░░███       / Private Config
# ░███  ░     ░███  ███    ░███ ░███    ░███ 
# █████       █████░░█████████  █████   █████
#░░░░░       ░░░░░  ░░░░░░░░░  ░░░░░   ░░░░░
#


set -e fish_user_paths

# Export Plug
set TERM "xterm-256color"  # 256 colors enabled
set -g fish_greeting ""
set fish_prompt "🐟 > "


set -U fish_cursor_insert line
set -U fish_cursor_replace_one underscore

# Autocomplete and highlight colors 

set fish_color_normal '#4E3636'
set fish_color_autosuggestion '#B0A4A4'
set fish_color_command '#957777'
set fish_color_error '#CD1818'
set fish_color_param '#6D5D6E'

#Alieses

alias ls='lsd'
alias l='lsd'
alias cat='bat'
alias update='sudo pacman -Syu'
alias parusyu='paru -Syu --noconfirm'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Process Status

alias psa="ps auxf"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias fzfc='fd | fzf --height=50% --reverse --border --preview "bat -n --color=always {}" --color=fg:#F2F7A1,bg:#040D12,hl:#bd93f9 --color=fg+:#C7E9B0,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#FFB4B4,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# StarShip
starship init fish | source

# For !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end



fish_add_path /home/supercode/.spicetify
