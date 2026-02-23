#!/bin/bash

# Script para mostrar el título de Spotify con efecto scrolling

# Ancho máximo visible en polybar
MAX_WIDTH=25

# Función para hacer scroll/marquee
scroll_text() {
  local text="$1"
  local width=$2
  local pos=$3

  local len=${#text}

  if [ $len -le $width ]; then
    printf "%-${width}s" "$text"
    return
  fi

  # Combina el texto consigo mismo para el loop infinito
  local combined="$text  •  $text  •  $text"
  local start=$((pos % len))
  local result=""

  for i in $(seq 0 $((width - 1))); do
    idx=$((start + i))
    if [ $idx -ge $len ]; then
      idx=$((idx % len + len + 3))
      if [ $idx -ge $((${#combined})) ]; then
        idx=$((idx % len))
      fi
    fi
    result+="${combined:$idx:1}"
  done

  echo "$result"
}

# Verificar si Spotify está abierto
if ! pgrep -x "spotify" >/dev/null 2>&1; then
  echo ""
  exit 0
fi

# Obtener título y artista (mostrar aunque esté pausado)
TITLE=$(playerctl -p spotify metadata title 2>/dev/null)
ARTIST=$(playerctl -p spotify metadata artist 2>/dev/null)

if [ -z "$TITLE" ]; then
  echo ""
  exit 0
fi

# Combinar título y artista
FULL_TEXT="$TITLE - $ARTIST"

# Usar un archivo para mantener la posición del scroll
SCROLL_FILE="/tmp/spotify_scroll_pos"
POS=0

if [ -f "$SCROLL_FILE" ]; then
  POS=$(cat "$SCROLL_FILE")
fi

# Incrementar posición (2 para hacer el scroll más rápido)
POS=$((POS + 2))

# Si el texto es corto, no hacer scroll
if [ ${#FULL_TEXT} -le 25 ]; then
  echo " $FULL_TEXT "
  exit 0
fi

# Calcular scroll
RESULT=$(scroll_text "$FULL_TEXT" 25 $POS)
echo " $RESULT "

# Guardar posición
echo $POS >"$SCROLL_FILE"
