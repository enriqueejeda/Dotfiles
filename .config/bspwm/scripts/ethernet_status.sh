#!/bin/sh

# Script de estado de Ethernet/WiFi para polybar
# SEGURO: Solo lee información de red, no modifica nada
# NOTA: Este script asume wlp1s0 - puedes cambiarlo según tu interfaz

echo "%{F#2495e7}󰈀 %{F#ffffff}$(/usr/sbin/ifconfig wlp1s0 | grep "inet " | awk '{print $2}')%{u-}"
