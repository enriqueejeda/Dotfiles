#!/usr/bin/env bash

# Script de lanzamiento de polybar
# SEGURO: No acepta input externo, solo inicia procesos

# 1. Terminar instancias de barras que ya se estén ejecutando
killall -q polybar

# 2. Esperar a que los procesos se hayan detenido completamente
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Lanzar la barra "emi-bar" usando el archivo de configuración
# Usa $HOME en lugar de ruta hardcodeada
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload emi-bar -c "$HOME/.config/polybar/config.ini" &
  done
else
  polybar --reload emi-bar -c "$HOME/.config/polybar/config.ini" &
fi
