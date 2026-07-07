# Keep terminal-startup output before Powerlevel10k instant prompt.
[[ $- == *i* ]] || return

if [[ -t 1 ]] && (( $+commands[fastfetch] )); then
    clear
    fastfetch
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local
