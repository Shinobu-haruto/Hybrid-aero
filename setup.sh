#!/usr/bin/env bash

# =========================================================
# HybridAero Setup Script
# ---------------------------------------------------------
# Installs HybridAero theme and optional DWM composition
# =========================================================

set -e

THEME_NAME="HybridAero"
THEME_DIR="$HOME/.themes/$THEME_NAME"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

clear
echo "========================================="
echo " HybridAero – Interface Setup"
echo "========================================="
echo
echo "This installer will:"
echo " • Install the HybridAero GTK theme"
echo " • Optionally install Picom for Aero Glass"
echo
read -rp "Press ENTER to continue..."

# ---------------------------------------------------------
# Install theme
# ---------------------------------------------------------

echo
echo "[1/3] Installing theme files..."

mkdir -p "$HOME/.themes"
rm -rf "$THEME_DIR"
cp -r "$SCRIPT_DIR" "$THEME_DIR"

echo "✔ Theme installed at:"
echo "  $THEME_DIR"

# ---------------------------------------------------------
# Picom installation
# ---------------------------------------------------------

echo
read -rp "Install Picom (recommended for Aero Glass)? [Y/n]: " PICOM_CHOICE
PICOM_CHOICE=${PICOM_CHOICE:-Y}

if [[ "$PICOM_CHOICE" =~ ^[Yy]$ ]]; then
    echo
    echo "[2/3] Installing Picom..."

    sudo apt update
    sudo apt install -y picom

    echo "✔ Picom installed"

    echo
    echo "[3/3] Applying HybridAero Picom patch..."

    mkdir -p "$HOME/.config/picom"
    cp "$THEME_DIR/gtk-3.0/patch/picom.conf" "$HOME/.config/picom/picom.conf"

    echo "✔ Picom configuration applied"
else
    echo
    echo "⚠ Picom installation skipped"
fi

# ---------------------------------------------------------
# Final message
# ---------------------------------------------------------

echo
echo "========================================="
echo " HybridAero installation completed"
echo "========================================="
echo
echo "Next steps:"
echo " • Open Cinnamon Settings → Themes"
echo " • Select '$THEME_NAME' in Controls"
echo
echo "To enable Aero Glass:"
echo " • Start Picom or relog your session"
echo
echo "A session restart is recommended."
echo
