-- ==================
-- GENERAL LAYOUT
-- ==================
hl.config({
    general = {
        gaps_in    = 2,
        gaps_out   = 2,
        border_size = 2,
        layout     = "dwindle",
    },

    -- ==================
    -- DECORATION
    -- ==================
    decoration = {
        rounding         = 12,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
          range        = 30,
          render_power = 5,
          offset       = "0 5",
          color        = "rgba(00000070)",
        },
    },

    -- ==================
    -- ANIMATIONS
    -- ==================
    animations = {
        enabled = true,
        animation = {
            { "windowsIn",   1, 3, "default" },
            { "windowsOut",  1, 3, "default" },
            { "workspaces",  1, 5, "default" },
            { "windowsMove", 1, 4, "default" },
            { "fade",        1, 3, "default" },
            { "border",      1, 3, "default" },
        },
    },

    -- ==================
    -- LAYOUTS
    -- ==================
    dwindle = {
        preserve_split = true,
    },
    master = {
        mfact = 0.5,
    },
})
