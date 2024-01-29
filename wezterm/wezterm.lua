-- Make it easier to switch fonts.
local fonts = {
    Dina = "Dina",
    Iosevka = "Iosevka Nerd Font Mono",
    IBMPlex = "IBM Plex Mono",
    Fira = "Fira Mono",
    Monaspace_Neon = "Monaspace Neon",
    Monaspace_Argon = "Monaspace Argon",
    Monaspace_Xenon = "Monaspace Xenon",
    Monaspace_Radon = "Monaspace Radon",
    Monaspace_Krypton = "Monaspace Krypton",
    Terminus = "Terminus",
    Tamzen = "Tamzen",
    Termsyn = "Termsyn",
    Cozette = "Cozette",
}

local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, _)
    window:set_right_status(wezterm.format({
        { Text = wezterm.strftime("%H:%M") },
    }))
end)

local act = wezterm.action
local config = {
    font = wezterm.font_with_fallback({ "Fira Code", "DinaRemaster" }),
    font_size = 10,
    color_scheme = "GruvboxDarkHard",
    colors = {
        -- background = "#131415",
        background = "#231719",
        foreground = "#ddc7a1"
    },
    window_background_opacity = 0.95,
    enable_tab_bar = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    enable_wayland = true,
    window_padding = {
        left = 2,
        right = 2,
        top = 4,
        bottom = 0,
    },
    disable_default_key_bindings = true,
    leader = { key = "b", mods = "CTRL" },
    keys = {
        -- tmux "emulation"
        -- C-b C-b actually sends C-b to the terminal
        { key = "b", mods = "LEADER|CTRL",  action = act({ SendString = "\x02" }) },
        {
            key = "\\",
            mods = "LEADER",
            action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
        },
        {
            key = '"',
            mods = "LEADER|SHIFT",
            action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }),
        },
        { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
        { key = "G", mods = "LEADER|SHIFT", action = act.ScrollToBottom },
        { key = "u", mods = "ALT|CTRL",     action = act.ScrollByPage(-1) },
        { key = "d", mods = "ALT|CTRL",     action = act.ScrollByPage(1) },
        { key = 'u', mods = "ALT",          action = act.ScrollByLine(-1) },
        { key = 'd', mods = "ALT",          action = act.ScrollByLine(1) },
        { key = "c", mods = "LEADER",       action = act({ SpawnTab = "CurrentPaneDomain" }) },
        { key = "h", mods = "LEADER",       action = act({ ActivatePaneDirection = "Left" }) },
        { key = "j", mods = "LEADER",       action = act({ ActivatePaneDirection = "Down" }) },
        { key = "k", mods = "LEADER",       action = act({ ActivatePaneDirection = "Up" }) },
        { key = "l", mods = "LEADER",       action = act({ ActivatePaneDirection = "Right" }) },
        { key = "H", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Left", 5 } }) },
        { key = "J", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
        { key = "K", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
        { key = "L", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Right", 5 } }) },
        {
            key = "n",
            mods = "LEADER",
            action = act.ActivateTabRelative(1),
        },
        {
            key = "p",
            mods = "LEADER",
            action = act.ActivateTabRelative(-1),
        },
        { key = "1", mods = "LEADER",       action = act({ ActivateTab = 0 }) },
        { key = "2", mods = "LEADER",       action = act({ ActivateTab = 1 }) },
        { key = "3", mods = "LEADER",       action = act({ ActivateTab = 2 }) },
        { key = "4", mods = "LEADER",       action = act({ ActivateTab = 3 }) },
        { key = "5", mods = "LEADER",       action = act({ ActivateTab = 4 }) },
        { key = "6", mods = "LEADER",       action = act({ ActivateTab = 5 }) },
        { key = "7", mods = "LEADER",       action = act({ ActivateTab = 6 }) },
        { key = "8", mods = "LEADER",       action = act({ ActivateTab = 7 }) },
        { key = "9", mods = "LEADER",       action = act({ ActivateTab = 8 }) },
        { key = "z", mods = "LEADER",       action = act.TogglePaneZoomState },
        { key = "&", mods = "LEADER|SHIFT", action = act({ CloseCurrentTab = { confirm = true } }) },
        { key = "x", mods = "LEADER",       action = act({ CloseCurrentPane = { confirm = true } }) },
        { key = "F", mods = "SHIFT|CTRL",   action = "ToggleFullScreen" },
        { key = "?", mods = "LEADER|SHIFT", action = act({ Search = { Regex = "" } }) },
        { key = "v", mods = "CTRL|SHIFT",   action = act.PasteFrom("Clipboard") },
        { key = "c", mods = "CTRL|SHIFT",   action = act.CopyTo("Clipboard") },
        { key = "L", mods = "CTRL|SHIFT",   action = act.ShowDebugOverlay },
    },
}

require("smart_splits")(config)

return config
