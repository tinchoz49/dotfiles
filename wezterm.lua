local wezterm = require 'wezterm';

return {
    enable_wayland = false,
    default_prog = {"/usr/bin/fish", "-l"},
    font = wezterm.font("FiraCode Nerd Font"),
    color_scheme = "Dracula",
    check_for_updates = false,
    hide_tab_bar_if_only_one_tab = true,
    leader = { key="a", mods="CTRL", timeout_milliseconds=1000 },
    keys = {
        {key="c", mods="LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        {key="q", mods="LEADER", action=wezterm.action{CloseCurrentPane={confirm=true}}},
        {key="v", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    },
}
