function fish_greeting
  clear
end

if not set -q GHOSTTY_RESOURCES_DIR
source /usr/share/cachyos-fish-config/cachyos-config.fish
end
if set -q GHOSTTY_RESOURCES_DIR
fetch
end

# overwrite greeting
# potentially disabling fastfetch

fish_add_path /home/skand/.spicetify
set -g fish_cursor_default underscore
set -g fish_cursor_insert underscore
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual underscore
