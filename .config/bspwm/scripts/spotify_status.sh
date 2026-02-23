#!/bin/bash

# Comprobar si Spotify está abierto
if ! pgrep -x "spotify" >/dev/null; then
  echo " %{F#666}󰝛" # Icono de música apagada si no está abierto
  exit 0
fi

# Obtener el estado (Playing/Paused)
STATUS=$(playerctl -p spotify status 2>/dev/null)

if [ "$STATUS" = "Playing" ]; then
  echo " %{T2}" # Icono de Pause (porque está sonando)
elif [ "$STATUS" = "Paused" ]; then
  echo " %{T2}" # Icono de Play (porque está pausado)
else
  echo " %{T2}" # Icono de Stop
fi
