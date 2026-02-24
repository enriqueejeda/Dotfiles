# dotfiles

Mi configuración personal del sistema. Usa BSPWM como window manager con una configuración optimizada para desarrollo.

## ⚡ Quick Start

```bash
cd ~/Desktop/dotfiles
./install.sh
```

## 📦 Requisitos

### Window Manager & Sistema

- `bspwm` - Window manager
- `sxhkd` - Hotkeys
- `polybar` - Barra superior
- `rofi` - Menú de aplicaciones
- `picom` - Compositor (transparencias)
- `feh` - Fondo de pantalla

### Terminal & Herramientas

- `kitty` - Terminal
- `neovim` - Editor (LazyVim config)
- `zellij` - Multiplexer
- `starship` - Prompt
- `zsh` - Shell

### Extras

- `fish` - Fish shell (config included)
- `btop` - Monitor de sistema
- `dolphin` - Explorador de archivos
- `NetworkManager-dmenu` - Wifi menu

## 🎨 Temas

- **Terminal**: Kitty con tema Tokyo Night
- **Prompt**: Starship con paleta "Gentleman"
- **Wallpaper**: Configurable en `~/.config/bspwm/bspwmrc`

## ⌨ atajos Principales (Super = Tecla Windows)

| Atajo                       | Acción                 |
| --------------------------- | ---------------------- |
| `Super + Return`            | Abrir terminal (Kitty) |
| `Super + d`                 | Menú Rofi              |
| `Super + f`                 | Firefox                |
| `Super + e`                 | Dolphin                |
| `Super + F4`                | Menú de apagado        |
| `Super + q`                 | Cerrar ventana         |
| `Super + m`                 | Mode monocle           |
| `Super + {h,j,k,l}`         | Mover foco             |
| `Super + Shift + {h,j,k,l}` | Mover ventana          |
| `Super + {1-5}`             | Escritorios            |
| `Super + Escape`            | Recargar SXHKD         |

### Audio & Brillo

- `XF86AudioRaiseVolume` - Subir volumen
- `XF86AudioLowerVolume` - Bajar volumen
- `XF86AudioMute` - Silenciar
- `XF86MonBrightnessUp` - Subir brillo
- `XF86MonBrightnessDown` - Bajar brillo

## 📁 Estructura

```
dotfiles/
├── .config/
│   ├── bspwm/          # Window manager
│   ├── sxhkd/          # Hotkeys
│   ├── polybar/        # Barra
│   ├── rofi/           # Menú
│   ├── picom/          # Compositor
│   ├── kitty/          # Terminal
│   ├── nvim/           # Neovim (LazyVim)
│   ├── zellij/         # Terminal multiplexer
│   └── starship/       # Prompt config
├── .zshrc              # Zsh config
├── .bash-preexec.sh    # Bash preexec
├── install.sh          # Script de instalación
└── .gitignore         # Archivos a ignorar
```

## 🔧 Personalización

### Wallpaper

Editá `~/.config/bspwm/bspwmrc` y cambiá:

```bash
WALLPAPER_PATH="${WALLPAPER_PATH:-$HOME/Pictures/wallpaper.png}"
```

O seteá la variable de entorno:

```bash
export WALLPAPER_PATH="/tu/ruta/al/wallpaper.jpg"
```

### Fuentes necesarias

- JetBrains Mono
- Hack Nerd Font
- Fira Code
- Font Awesome (para iconos)

## 🤖 Pós-instalación (manual)

1. Instalar LinuxBrew (si no lo tenés)
2. Ejecutar `brew install bat lsd fzf zoxide starship atuin`
3. Configurar neovim: `nvim +Lazy! sync`
4. Instalar fuentes Nerd Fonts
5. Reiniciar sesión

## 🙏 Créditos y Agradecimientos

Esta configuración no habría sido posible sin el trabajo de grandes desarrolladores de la comunidad que han compartido sus dotfiles y tutoriales de forma abierta.

### Inspiración y Recursos

- **[s4vitar](https://www.youtube.com/@s4vitar)** — Su curso de **Hack4u** ha sido fundamental para entender el funcionamiento de BSPWM, la automatización del entorno y las técnicas de hardening en Linux. Gran parte de la estructura y filosofía de este setup viene de sus materiales.

- **[Gentleman Programming](https://gentlemanprogramming.com/)** — La configuración de **Neovim** está basada en su excepcional trabajo con LazyVim. También utilizo su herramienta **OpenCode** como base para el entorno de desarrollo,con sus agentes y configuracion con engram excepcional. Su enfoque en la productividad y la estética es simplemente outstanding.

- **[adi1090x](https://github.com/adi1090x)** — El tema de **Rofi** utilizado proviene de su increíble colección de configuraciones. Prácticamente no he modificado nada, ya que su trabajo es excelente tal cual.

- **[gh0stzk](https://github.com/gh0stzk)** — La base de **Polybar** viene de una de sus configuraciones. He realizado algunas adaptaciones y eliminaciones para ajustarla a mis necesidades, pero el trabajo original es suyo.

### Otros Recursos

- **[LazyVim](https://lazyvim.org/)** — La base de la configuración de Neovim
- **[BSPWM](https://github.com/baskerville/bspwm)** — El window manager
- **[Picom](https://github.com/yshui/picom)** — Compositor de ventanas
- **[Kitty](https://github.com/kovidgoyal/kitty)** — Terminal emulator

---

**¿Preguntas o problemas?** Creates un issue en el repo.
