-- ==================
-- WINDOW RULES
-- ==================
hl.window_rule({ match = { class = "org%.wezfurlong%.wezterm" },  tile = true })
hl.window_rule({ match = { class = "org%.gnome%." },              rounding = 12 })
hl.window_rule({ match = { class = "gnome-control-center" },      tile = true })
hl.window_rule({ match = { class = "pavucontrol" },               tile = true })
hl.window_rule({ match = { class = "nm-connection-editor" },      tile = true })
hl.window_rule({ match = { class = "gnome-calculator" },          float = true })
hl.window_rule({ match = { class = "galculator" },                float = true })
hl.window_rule({ match = { class = "blueman-manager" },           float = true })
hl.window_rule({ match = { class = "org%.gnome%.Nautilus" },      float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal" },        float = true })

hl.window_rule({ match = { class = "steam", title = "notificationtoasts" }, no_initial_focus = true, pin = true })

hl.window_rule({ match = { class = "firefox", title = "Picture-in-Picture" }, float = true })
hl.window_rule({ match = { class = "zoom" },                      float = true })

hl.window_rule({
    name    = "overwatch-fullscreen",
    match   = { class = "overwatch.*" },
    fullscreen = true,
    monitor = "DP-1",
})

-- Steam games (covers all steam_app_XXXXX classes)
hl.window_rule({
    name    = "steam-games-fullscreen",
    match   = { class = "steam_app.*" },
    fullscreen = true,
    monitor = "DP-1",
})

-- DMS windows floating by default
-- ! Hyprland doesn't size these windows correctly so disabling by default here
-- hl.window_rule({ match = { class = "org.quickshell" }, float = true })
hl.layer_rule({ match = { namespace = "quickshell" }, no_anim = true })
hl.layer_rule({ match = { namespace = "dms:.*" },     no_anim = true })
