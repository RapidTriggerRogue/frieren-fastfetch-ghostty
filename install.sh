#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing Frieren Fastfetch & Ghostty configuration..."
mkdir -p "$HOME/.config/fastfetch" "$HOME/.config/ghostty"

if [[ -f "$HOME/.config/fastfetch/config.jsonc" ]]; then
  cp "$HOME/.config/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc.bak"
  echo "  -> Backed up existing ~/.config/fastfetch/config.jsonc to config.jsonc.bak"
fi

if [[ -f "$HOME/.config/ghostty/config" ]]; then
  cp "$HOME/.config/ghostty/config" "$HOME/.config/ghostty/config.bak"
  echo "  -> Backed up existing ~/.config/ghostty/config to config.bak"
fi

cp "$REPO_DIR/assets/frieren.png" "$HOME/.config/fastfetch/frieren.png"
cp "$REPO_DIR/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
cp "$REPO_DIR/ghostty/config" "$HOME/.config/ghostty/config"

# Clear fastfetch image cache so the new image renders cleanly
rm -rf "$HOME/.cache/fastfetch/images"

echo "==> Done! Open a new Ghostty window or run: fastfetch"
