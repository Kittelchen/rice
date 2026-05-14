--local ipc = "qs -c noctalia-shell ipc call"

-- 1. Noctalia binds
shell("SUPER + SPACE",     "launcher toggle",                  "Launcher")
shell("SUPER + S",         "controlCenter toggle",             "Control Center")
shell("SUPER + comma",     "settings toggle",                  "Settings")
shell("SUPER + F1",        "plugin:keybind-cheatsheet toggle", "Cheatsheet")
shell("CTRL + ALT + Delete","sessionMenu toggle",            "Session Menu")
shell("SUPER + V",         "plugin:clipper toggle",            "Clipboard")
shell("SUPER + Tab",       "plugin:workspace-overview toggle", "Workspace Overview")

-- 2. Windows
hl.bind("SUPER + D",               hl.dsp.window.fullscreen({ mode = "maximized" }),  { description = "Maximize Window" })
hl.bind("SUPER + F",               hl.dsp.window.fullscreen(),                        { description = "Complete Fullscreen" })
hl.bind("SUPER + SHIFT + F",       hl.dsp.window.float({ action = "toggle" }),        { description = "Toggle floating" })
hl.bind("SUPER + Q",               hl.dsp.window.close(),                             { description = "Kill active window" })

-- Mouse drag
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- Focus
hl.bind("SUPER + right", hl.dsp.focus({ direction =  "r" }), { description = "Focus next window (right)" })
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "l" }), { description = "Focus next window (left)" })
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "u" }), { description = "Focus next window (up)" })
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "d" }), { description = "Focus next window (down)" })

hl.bind("SUPER + SHIFT + CTRL + down",  hl.dsp.window.move({ monitor = "d" }))
hl.bind("SUPER + SHIFT + CTRL + left",  hl.dsp.window.move({ monitor = "l" }))
hl.bind("SUPER + SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind("SUPER + SHIFT + CTRL + up",    hl.dsp.window.move({ monitor = "u" }))

hl.bind("SUPER + CTRL + left",          hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + right",         hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + SHIFT + minus",  hl.dsp.window.resize({ x = 0,    y = -10, relative = true, percent = true }), { repeating = true })
hl.bind("SUPER + equal",          hl.dsp.window.resize({ x = 10,   y = 0,   relative = true, percent = true }), { repeating = true })
hl.bind("SUPER + minus",          hl.dsp.window.resize({ x = -10,  y = 0,   relative = true, percent = true }), { repeating = true })
hl.bind("SUPER + code:20",        hl.dsp.window.resize({ x = -100, y = 0,   relative = true }), { description = "Expand window left" })
hl.bind("SUPER + code:21",        hl.dsp.window.resize({ x = 100,  y = 0,   relative = true }), { description = "Shrink window left" })
-- 3. Workspaces
for i = 1, 9 do
    hl.bind("SUPER + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
    hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ workspace = "e-1!" }))

    -- Numpad workspace binds
    local numpad = {
        { key = "KP_End",   ws = 1 },
        { key = "KP_Down",  ws = 2 },
        { key = "KP_Next",  ws = 3 },
        { key = "KP_Left",  ws = 4 },
        { key = "KP_Begin", ws = 5 },
        { key = "KP_Right", ws = 6 },
    }
    for _, entry in ipairs(numpad) do
        hl.bind("SUPER + " .. entry.key,         hl.dsp.focus({ workspace = entry.ws }),        { description = "Switch to #" .. entry.ws .. " (Numpad)" })
        hl.bind("SUPER + SHIFT + " .. entry.key, hl.dsp.window.move({ workspace = entry.ws }), { description = "Move to #" .. entry.ws .. " (Numpad)" })
    end

        -- Move focused window to next/previous workspace on same monitor
        hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ workspace = "m+1" }), { description = "Move window to next workspace on monitor" })
        hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ workspace = "m-1" }), { description = "Move window to prev workspace on monitor" })

        -- 4. System and apps
        hl.bind("SUPER + E",            hl.dsp.exec_cmd("dolphin"),      { description = "Dolphin" })
        hl.bind("SUPER + Return",       hl.dsp.exec_cmd("kitty"),         { description = "Terminal" })
        hl.bind("Print",                hl.dsp.exec_cmd("catbox"),        { description = "Catbox" })
        hl.bind("SUPER + SHIFT + V",   hl.dsp.exec_cmd("pwvucontrol"),   { description = "Volume Control Panel" })
        hl.bind("SUPER + M",           hl.dsp.exec_cmd("togglemute"),    { description = "Toggle Mute" })

-- Media keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. " volume increase"),   { repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. " volume decrease"),   { repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. " volume muteOutput"), { repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. " brightness increase"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"), { repeating = true })

