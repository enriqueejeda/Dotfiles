#!/bin/bash

# Script de target para polybar
# SEGURO: Solo lee un archivo de configuración, no acepta input externo

TARGET_FILE="$HOME/.config/bin/target"

ip_address=$(/bin/cat "$TARGET_FILE" 2>/dev/null | awk '{print $1}')
machine_name=$(/bin/cat "$TARGET_FILE" 2>/dev/null | awk '{print $2}')

if [ "$ip_address" ] && [ "$machine_name" ]; then
    echo "%{F#e51d0b}󰓾%{F#ffffff}$ip_address%{u-} - $machine_name"
else
    echo "%{F#e51d0b}󰓾%{u-}%{F#ffffff} No target"
fi
