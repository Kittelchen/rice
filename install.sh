#!/bin/bash
# ─────────────────────────────────────────
# Dotfiles Update Script
# ─────────────────────────────────────────

RICE_DIR="$(cd "$(dirname "$0")" && pwd)"
HYPR_DIR="$HOME/.config/hypr"

echo "Copying hypr config files..."

mkdir -p "$HYPR_DIR"

cp "$RICE_DIR/dotfiles/hypr/"*.conf "$HYPR_DIR/"

echo "✔ Done! Run: hyprctl reload"d