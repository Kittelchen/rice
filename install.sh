#!/bin/bash
# ─────────────────────────────────────────
# Dotfiles Update Script
# ─────────────────────────────────────────
RICE_DIR="$(cd "$(dirname "$0")" && pwd)"
HYPR_DIR="$HOME/.config/hypr"
KITTY_DIR="$HOME/.config/kitty"
FISH_DIR="$HOME/.config/fish"
BIN_DIR="$HOME/.local/bin"

COPY_HYPR=false
COPY_KITTY=false
COPY_FISH=false
COPY_BIN=false

for arg in "$@"; do
  case $arg in
    --hypr)  COPY_HYPR=true ;;
    --kitty) COPY_KITTY=true ;;
    --fish)  COPY_FISH=true ;;
    --bin)   COPY_BIN=true ;;
  esac
done

# if no flags given, copy everything
if ! $COPY_HYPR && ! $COPY_KITTY && ! $COPY_FISH && ! $COPY_BIN; then
  COPY_HYPR=true
  COPY_KITTY=true
  COPY_FISH=true
  COPY_BIN=true
fi

if $COPY_HYPR; then
  echo "Copying hypr config files..."
  mkdir -p "$HYPR_DIR"
  cp "$RICE_DIR/dotfiles/hypr/"*.conf "$HYPR_DIR/"
  echo "✔ hypr done!"
fi

if $COPY_KITTY; then
  echo "Copying kitty config files..."
  mkdir -p "$KITTY_DIR"
  cp "$RICE_DIR/dotfiles/kitty/kitty.conf" "$KITTY_DIR/"
  echo "✔ kitty done!"
fi

if $COPY_FISH; then
  echo "Copying fish config files..."
  mkdir -p "$FISH_DIR"
  cp "$RICE_DIR/dotfiles/fish/config.fish" "$FISH_DIR/"
  echo "✔ fish done!"
fi

if $COPY_BIN; then
  echo "Copying bin files..."
  mkdir -p "$BIN_DIR"
  cp "$RICE_DIR/dotfiles/bin/"* "$BIN_DIR/"
  echo "✔ bin done!"
fi