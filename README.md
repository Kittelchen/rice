# dotfiles

Personal configuration files for my Hyprland setup on Arch Linux.

> ⚠️ **Heads up:** These are my personal dotfiles, tailored to my own machine.
> I make no guarantees they'll work out of the box for you — use them as
> reference or inspiration, not a plug-and-play solution.

> 🚧 **Work in Progress:** This is me finding my feet with Linux for the first time.
> Things will change, break, and improve over time.

## What's in here

| File | Location | Notes |
|------|----------|-------|
| `dotfiles/hypr/*.conf` | `~/.config/hypr/` | Main Hyprland config |
| `dotfiles/hypr/binds.conf` | `~/.config/hypr/binds.conf` | Custom keybinds |

## Custom Keybinds

| Keybind | Action |
|---------|--------|
| `Super + E` | Open file manager |
| `Super + T` | Open terminal |
| `Super` / `Super_L` | Open app launcher |

## Install

Run the install script to copy all files into their matching config directories:

```bash
bash install.sh
```

Or copy manually to the locations listed above.

## Notes

- Keyboard layout is set to **DE** — change `keyboard.conf` if you need something else
