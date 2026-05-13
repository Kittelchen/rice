mainMod       = "SUPER"
terminal      = "kitty"
fileManager   = "dolphin"
browser       = "firefox"
volumeControl = "pwvucontrol"
ipc           = "qs -c noctalia-shell ipc call"


function shellexec(action)
    return hl.dsp.exec_cmd(ipc .. " " .. action)
end