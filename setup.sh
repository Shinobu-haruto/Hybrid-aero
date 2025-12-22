#!/usr/bin/env bash

# =========================================================
# HybridAero Setup Script
# ---------------------------------------------------------
# Aero / DWM-style interface installer for GTK
# =========================================================

set -e

THEME_NAME="HybridAero"
THEME_DIR="$HOME/.themes/$THEME_NAME"
PICOM_CONF="$HOME/.config/picom/picom.conf"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

ACTION="${1:-install}"

clear
echo "========================================="
echo " HybridAero – Interface Setup"
echo " Desktop Window Manager Compatibility"
echo "========================================="
echo

# ---------------------------------------------------------
# Uninstall mode
# ---------------------------------------------------------

if [[ "$ACTION" == "--uninstall" ]]; then
    echo "Uninstall mode selected"
    echo

    read -rp "Remove HybridAero theme and patches? [y/N]: " CONFIRM
    CONFIRM=${CONFIRM:-N}

    if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
        echo "Uninstall cancelled."
        exit 0
    fi

    echo
    echo "[1/2] Removing HybridAero theme..."

    if [[ -d "$THEME_DIR" ]]; then
        rm -rf "$THEME_DIR"
        echo "✔ Theme removed"
    else
        echo "Theme not found, skipping"
    fi

    echo
    echo "[2/2] Removing HybridAero Picom patch..."

    if [[ -f "$PICOM_CONF" ]]; then
        rm -f "$PICOM_CONF"
        echo "✔ Picom configuration removed"
    else
        echo "Picom patch not found, skipping"
    fi

    echo
    echo "========================================="
    echo " HybridAero successfully removed"
    echo "========================================="
    echo
    echo "A session restart is recommended."
    exit 0
fi

# ---------------------------------------------------------
# Install mode
# ---------------------------------------------------------

DESKTOP_SESSION_NAME="${XDG_CURRENT_DESKTOP:-Unknown}"

echo "Detected desktop environment: $DESKTOP_SESSION_NAME"
echo

if [[ "$DESKTOP_SESSION_NAME" != *"Cinnamon"* ]]; then
    echo "⚠ Warning:"
    echo " HybridAero is optimized for Cinnamon."
    echo " Visual differences may occur on other environments."
    echo
    read -rp "Continue installation anyway? [Y/n]: " CONTINUE_CHOICE
    CONTINUE_CHOICE=${CONTINUE_CHOICE:-Y}

    if [[ ! "$CONTINUE_CHOICE" =~ ^[Yy]$ ]]; then
        echo "Installation aborted."
        exit 1
    fi
fi

read -rp "Press ENTER to continue..."

# ---------------------------------------------------------
# Install theme
# ---------------------------------------------------------

echo
echo "[1/4] Installing HybridAero theme files..."

mkdir -p "$HOME/.themes"
rm -rf "$THEME_DIR"
cp -r "$SCRIPT_DIR" "$THEME_DIR"

echo "✔ Theme installed at:"
echo "  $THEME_DIR"

# ---------------------------------------------------------
# Picom detection
# ---------------------------------------------------------

echo
if command -v picom >/dev/null 2>&1; then
    PICOM_INSTALLED=true
    echo "Picom detected on system."
else
    PICOM_INSTALLED=false
    echo "Picom not detected."
fi

# ---------------------------------------------------------
# Picom installation
# ---------------------------------------------------------

if ! $PICOM_INSTALLED; then
    echo
    read -rp "Install Picom (recommended for Aero Glass)? [Y/n]: " PICOM_CHOICE
    PICOM_CHOICE=${PICOM_CHOICE:-Y}

    if [[ "$PICOM_CHOICE" =~ ^[Yy]$ ]]; then
        echo
        echo "[2/4] Installing Picom..."

        sudo apt update
        sudo apt install -y picom

        echo "✔ Picom installed"
        PICOM_INSTALLED=true
    else
        echo "⚠ Picom installation skipped"
    fi
fi

# ---------------------------------------------------------
# Apply Picom patch
# ---------------------------------------------------------

if $PICOM_INSTALLED; then
    echo
    echo "[3/4] Applying HybridAero composition patch..."

    mkdir -p "$HOME/.config/picom"
    cp "$THEME_DIR/gtk-3.0/patch/picom.conf" "$PICOM_CONF"

    echo "✔ Picom configuration applied"
fi

# ---------------------------------------------------------
# Final status
# ---------------------------------------------------------

echo
echo "[4/4] Finalizing setup..."
echo
echo "========================================="
echo " HybridAero installation completed"
echo "========================================="
echo
echo "System status:"
echo " • Theme installed        : YES"
echo " • Cinnamon optimized     : YES"
echo " • Picom available        : $PICOM_INSTALLED"
echo
echo "Next steps:"
echo " • Open Cinnamon Settings → Themes"
echo " • Select '$THEME_NAME' in Controls"
echo
if $PICOM_INSTALLED; then
    echo "To enable Aero Glass:"
    echo " • Start Picom or relog your session"
fi
echo
echo "A session restart is recommended."
echo
