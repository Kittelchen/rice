-- ==================
-- STARTUP APPS
-- ==================
hl.on("hyprland.start", function()
hl.exec_cmd("qs -c noctalia-shell")
hl.exec_cmd("dbus-update-activation-environment --systemd --all")
hl.exec_cmd("systemctl --user start hyprland-session.target")
hl.exec_cmd("systemctl --user start hyprpolkitagent")
hl.exec_cmd("sleep 3 && steam -silent")
hl.exec_cmd("sleep 5 && Telegram -startintray")
hl.exec_cmd("sleep 7 && discord")
hl.exec_cmd("sleep 10 && hyprctl reload")
end)
