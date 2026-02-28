#!/bin/sh

# Script de estado de VPN para polybar
# SEGURO: Solo lee información de red, no modifica nada
# NOTA: Detecta tun0 como interfaz VPN padrão
 
IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
 
if [ "$IFACE" = "tun0" ]; then
    echo "%{F#1bbf3e}󰆧 %{F#ffffff}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
    echo "%{F#1bbf3e}󱐝 %{u-} Disconnected"
fi
