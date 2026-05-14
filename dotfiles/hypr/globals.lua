mainMod       = "SUPER"
terminal      = "kitty"
fileManager   = "dolphin"
browser       = "firefox"
volumeControl = "pwvucontrol"
ipc           = "qs -c noctalia-shell ipc call"

function shell(shortkey, cmd, description)
    return hl.bind(shortkey, hl.dsp.exec_cmd(ipc .. " " .. cmd), { description = description })
end
