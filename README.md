# dotfiles
Personal configuration files for my Hyprland setup.
> ⚠️ **Heads up:** These are my personal dotfiles, tailored to my own machine.
> I make no guarantees they'll work out of the box for you — use them as
> reference or inspiration, not a plug-and-play solution.

## Based on
This setup is built on top of [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell).
Set that up first before using anything from this repo.

## What's in here
| File | Location | Notes |
|---|---|---|
| `dotfiles/hypr/*.conf` | `~/.config/hypr/` | Main Hyprland config |
| `dotfiles/hypr/binds.conf` | `~/.config/hypr/binds.conf` | Custom keybinds — DMS generates its own `binds.conf` but this overrides/extends it with my personal bindings |
| `dotfiles/kitty/kitty.conf` | `~/.config/kitty/kitty.conf` | Kitty terminal config |

## Custom Keybinds
| Keybind | Action |
|---|---|
| `Super + E` | Open Dolphin (file explorer) |
| `Super + T` | Open Kitty (terminal) |
| `Super` / `Super_L` | Open app launcher |

## Install
Run the copy script to place all files into their matching config directories:
```bash
bash install.sh
```
Or copy manually to the locations listed above.

## Notes
- Keyboard layout is set to **DE** — change `keyboard.conf` if you need something else
- DMS auto-generates its own `binds.conf` via the settings UI — my `binds.conf` overrides or adds on top of that