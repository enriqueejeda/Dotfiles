#!/bin/sh

# Si está apagado
if [ $(bluetoothctl show | grep "Powered: yes" | wc -l) -eq 0 ]; then
  echo "󰂲 0" 
  exit 0
fi

devices_paired=$(bluetoothctl devices Paired | cut -d ' ' -f 2)
counter=0

for device in $devices_paired; do
    if bluetoothctl info "$device" | grep -q "Connected: yes"; then
        counter=$((counter + 1))
    fi
done

if [ "$counter" -gt 0 ]; then
    echo " $counter"
else
    echo " " # Espacio vacío después del icono
fi
