# Enrique Ejeda Dots - Configuración del Sistema

Un dotfiles completo y bien estructurado para replicar mi entorno de trabajo en Linux con bspwm, polybar y más.

## 📸 Preview

```
┌─────────────────────────────────────────────────────────────────────────┐
│ 󰇙  I 󰑊  II 󰑊  III 󰑊  IV 󰑊  V           󱋋 192.168.1.50         󱋋 VPN  │
│                                                                         │
│ enriqueejeda:~/Projects/dotfiles  󰎙 20.0.0  󰉖 main  ⣿███████░░░░   │
│ ❯                                                                       │
└─────────────────────────────────────────────────────────────────────────┘
```

## 🗂️ Estructura del Repositorio

```
dotfiles/
├── README.md                    # Este archivo
├── home/                        # Archivos de ~/. (raíz)
│   ├── .bashrc                  # Configuración de Bash
│   └── .zshrc                   # Configuración de Zsh (PRINCIPAL)
└── .config/                     # Configuración de ~/.config
    ├── bspwm/                   # Window Manager
    │   ├── bspwmrc              # Configuración principal
    │   └── scripts/            # Scripts de bspwm
    ├── sxhkd/                   # Atajos de teclado
    │   └── sxhkdrc
    ├── polybar/                 # Barra de estado
    │   ├── config.ini
    │   ├── modules.ini
    │   └── launch.sh
    ├── rofi/                    # Menú de aplicaciones
    │   ├── launchers/
    │   └── powermenu/
    ├── kitty/                   # Terminal
    │   └── kitty.conf
    └── nvim/                    # NeoVim (basado en LazyVim)
        ├── init.lua
        ├── lazyvim.json
        ├── lazy-lock.json
        └── lua/
```

## 🚀 Instalación Manual

### Prerrequisitos

Instala los paquetes necesarios según tu distribución:

#### Debian/Ubuntu

```bash
# Shells y Terminal
sudo apt install zsh bash

# Terminal
sudo apt install kitty

# Window Manager
sudo apt install bspwm sxhkd

# UI y Utilidades
sudo apt install polybar rofi picom feh

# Utilidades (IMPORTANTE: usar lsd y bat en vez de ls y cat)
sudo apt install lsd bat ripgrep fd-find

# Herramientas de Desarrollo
sudo apt install git curl wget htop btop nodejs npm python3

# Build tools
sudo apt install build-essential cmake
```

#### Arch Linux

```bash
sudo pacman -S bspwm sxhkd polybar rofi picom feh kitty lsd bat ripgrep fd-find zsh git curl wget htop btop nodejs npm python3
```

### Instalación

1. **Clonar el repositorio:**

```bash
git clone https://github.com/enriqueejeda/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. **Copiar archivos de configuración:**

```bash
# Archivos home
cp home/.zshrc ~/.zshrc
cp home/.bashrc ~/.bashrc

# Configuraciones
cp -r .config/* ~/.config/
```

3. **Instalar Oh My Zsh:**

Más info: https://github.com/ohmyzsh/ohmyzsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

4. **Instalar plugins de Zsh:**

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

5. **Instalar Starship:**

Más info: https://starship.rs/

```bash
curl -sS https://starship.rs/install.sh | sh -s -- -y
```

6. **Instalar Atuin (historial mejorado):**

Más info: https://github.com/atuinsh/atuin

```bash
cargo install atuin
```

7. **Instalar Zoxide (cd inteligente):**

Más info: https://github.com/ajeetdsouza/zoxide

```bash
curl -sSfL https://github.com/ajeetdsouza/zoxide/releases/latest/download/zoxide-x86_64-unknown-linux-musl.tar.gz | tar xz -C /tmp
sudo mv /tmp/zoxide /usr/local/bin/
```

8. **Instalar fuentes:**

Más info: https://github.com/ryanoasis/nerd-fonts

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip Hack.zip && rm Hack.zip
wget https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip && rm JetBrainsMono-2.304.zip
fc-cache -f -v
```

9. **Dar permisos de ejecución:**

```bash
chmod +x ~/.config/bspwm/scripts/*
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/rofi/launchers/type-3/launcher.sh
chmod +x ~/.config/rofi/powermenu/type-2/powermenu.sh
```

10. **Instalar y configurar NeoVim:**

Más info de configuración: https://github.com/LazyVim/LazyVim

```bash
# Instalar NeoVim (versión reciente)
cd /tmp
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/nvim
sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

# Instalar dependencias para plugins
npm install -g neovim

# Abrir nvim y esperar a que se instalen los plugins
nvim
```

11. **Personalizar el fondo de pantalla:**

Edita `~/.config/bspwm/bspwmrc` y cambia la ruta del wallpaper:

```bash
/usr/bin/feh --bg-fill /ruta/a/tu/imagen.jpg &
```

12. **Iniciar sesión:**

```bash
# Iniciar bspwm desde tty o login manager
startx
```

## 📋 Atajos de Teclado

### BSPWM + SXHKD

| Atajo | Acción |
|-------|--------|
| `Super + Return` | Abrir terminal (kitty) |
| `Super + d` | Menú de aplicaciones (rofi) |
| `Super + F4` | Menú de apagado |
| `Super + q` | Cerrar ventana |
| `Super + m` | Modo monocle |
| `Super + g` | Intercambiar con ventana más grande |
| `Super + t/s/f` | Estado: tiled/pseudo_tiled/floating |
| `Super + {h,j,k,l}` | Moverse entre ventanas |
| `Super + {1-9,0}` | Ir a escritorio |
| `Super + Shift + {1-9,0}` | Mover ventana a escritorio |
| `Super + Alt + {h,j,k,l}` | Redimensionar ventana |
| `Super + Escape` | Recargar SXHKD |

### Audio y Brillo

| Atajo | Acción |
|-------|--------|
| `XF86AudioRaiseVolume` | Subir volumen |
| `XF86AudioLowerVolume` | Bajar volumen |
| `XF86AudioMute` | Silenciar |
| `XF86MonBrightnessUp` | Subir brillo |
| `XF86MonBrightnessDown` | Bajar brillo |

## 🔧 Solución de Problemas

### La barra polybar no aparece

```bash
# Verificar que polybar está instalado
which polybar

# Ejecutar manualmente
polybar --reload emi-bar -c ~/.config/polybar/config.ini
```

### NeoVim no inicia

```bash
# Verificar dependencias
nvim --version

# Actualizar plugins
nvim --headless "+Lazy! sync" +qa
```

### Atajos no funcionan

```bash
# Verificar que sxhkd está corriendo
pgrep sxhkd

# Recargar configuración
pkill -USR1 -x sxhkd
```

## 📄 Licencia

MIT License - Puedes usar, modificar y distribuir este configuración libremente.

## 🙏 Créditos y Agradecimientos

- **[s4vitar](https://www.youtube.com/@s4vitar)** - Por la inspiración en su curso de [Hack4u](https://hack4u.io/) y los conocimientos sobre bspwm/polybar
- **[Gentleman-programing](https://github.com/gentleman-programming)** - Por sus proyectos open source, la configuración de [nvim ipecable](https://github.com/gentleman-programming/nvim-ipecable) y [opencode](https://github.com/gentleman-programming/opencode)
- **[z0mbi3](https://github.com/gh0stzk)** - Por la inspiración del tema y los dotfiles originales
- **[Aditya Shakya (adi1090x)](https://github.com/adi1090x)** - Por los temas de Rofi
- Comunidad de dotfiles en GitHub por la inspiración continua

---

**Nota**: Esta configuración está optimizada para Arch Linux y distribuciones basadas en Debian. Algunos paquetes pueden variar según tu distribución.
