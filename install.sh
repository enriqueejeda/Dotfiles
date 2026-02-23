#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════════
# dotfiles install.sh - Instala tus dotfiles creando symlinks
# ═══════════════════════════════════════════════════════════════════════════════

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           dotfiles Installation Script                     ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
echo ""

# Función para crear backup
backup_file() {
    local file="$1"
    if [ -e "$file" ] && [ ! -L "$file" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$file" "$BACKUP_DIR/"
        echo -e "${YELLOW}  ⚠ Backup: $file -> $BACKUP_DIR/${NC}"
    fi
}

# Función para crear symlink
link_file() {
    local src="$DOTFILES_DIR/$1"
    local dest="$HOME/$1"
    local desc="$2"

    # Crear directorio padre si no existe
    local parent="$(dirname "$dest")"
    if [ ! -d "$parent" ]; then
        mkdir -p "$parent"
    fi

    # Backup si existe y no es link
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        backup_file "$dest"
    fi

    # Crear link
    if [ ! -L "$dest" ]; then
        ln -sf "$src" "$dest"
        echo -e "  ✓ Linked: $desc"
    else
        echo -e "  • Skip (already linked): $desc"
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
# Configs principales
# ═══════════════════════════════════════════════════════════════════════════════

echo -e "${GREEN}[1/5] Linking shell configs...${NC}"
link_file ".zshrc" "Zsh config"
link_file ".bash-preexec.sh" "Bash preexec"
link_file ".profile" "Profile"

echo ""
echo -e "${GREEN}[2/5] Linking window manager configs...${NC}"
link_file ".config/bspwm" "BSPWM config"
link_file ".config/sxhkd" "SXHKD hotkeys"
link_file ".config/polybar" "Polybar"
link_file ".config/rofi" "Rofi"
link_file ".config/picom" "Picom (compositor)"

echo ""
echo -e "${GREEN}[3/5] Linking terminal & editor configs...${NC}"
link_file ".config/kitty" "Kitty terminal"
link_file ".config/nvim" "Neovim"
link_file ".config/zellij" "Zellij"

echo ""
echo -e "${GREEN}[4/5] Linking other configs...${NC}"
link_file ".config/starship/starship.toml" "Starship prompt"
link_file ".config/autostart" "Autostart apps"
link_file ".config/bin" "Personal bin scripts"

echo ""
echo -e "${GREEN}[5/5] Creating necessary directories...${NC}"
mkdir -p "$HOME/.local/share/nvim/site/lazy"
echo -e "  ✓ Created: ~/.local/share/nvim/site/lazy"

# ═══════════════════════════════════════════════════════════════════════════════
# Notas finales
# ═══════════════════════════════════════════════════════════════════════════════

echo ""
echo -e "${GREEN}════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  ¡Instalación completada!${NC}"
echo -e "${GREEN}════════════════════════════════════════════════════════════${NC}"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}⚠ Se hizo backup de archivos existentes en:${NC}"
    echo "   $BACKUP_DIR"
    echo ""
fi

echo -e "${YELLOW}📋 Pasos adicionales recomendados:${NC}"
echo "   1. Instalar fuentes: JetBrains Mono, Hack, Fira Code, Nerd Fonts"
echo "   2. Reiniciar sesión o ejecutar: source ~/.zshrc"
echo "   3. Instalar dependencias: bspwm, sxhkd, polybar, rofi, picom, kitty, neovim"
echo "   4. Ajustar WALLPAPER_PATH en ~/.config/bspwm/bspwmrc"
echo ""

echo -e "${CYAN}💡 Para desinstalar:${NC}"
echo "   Eliminar los symlinks y restaurar desde $BACKUP_DIR"
echo ""
