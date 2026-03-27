# dotfiles

Personal configuration files for my Hyprland setup on Arch Linux.

> ⚠️ **Heads up:** These are my personal dotfiles, tailored to my own machine.
> I make no guarantees they'll work out of the box for you — use them as
> reference or inspiration, not a plug-and-play solution.

> 🚧 **Work in Progress:** This is me finding my feet with Linux for the first time.
> Things will change, break, and improve over time.

## Install

Run the install script to copy all files into their matching config directories:

```bash
bash install.sh
```

Or copy manually to the appropriate locations

## Credits 

This setup is built on top of [noctalia-shell](https://github.com/noctalia-dev/noctalia-shell) by noctalia-dev.

### Plugins

Plugins  are also based on the ones from that project and have been modified by me, these are the current ones:

| Plugin | Original | Changes |
|--------|----------|---------|
| `video-wallpaper` | [noctalia-plugins](https://github.com/noctalia-dev/noctalia-plugins/tree/main/video-wallpaper) | Max search depth is now user-configurable (was hardcoded to 1); right-clicking a thumbnail opens the video file via `xdg-open` |


## Notes

- Keyboard layout is set to **DE** — change `keyboard.conf` if you need something else
