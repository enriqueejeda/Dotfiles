#!/usr/bin/env bash

# 1. Terminar instancias de barras que ya se estén ejecutando
killall -q polybar

# 2. Esperar a que los procesos se hayan detenido completamente
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Lanzar la barra "emi-bar" usando el archivo de configuración
# Reemplaza 'config.ini' por el nombre real de tu archivo si es distinto
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload emi-bar -c ~/.config/polybar/config.ini &
  done
else
  polybar --reload emi-bar -c ~/.config/polybar/config.ini &
fi
