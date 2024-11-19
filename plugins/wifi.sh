# #!/bin/zsh
#
# # Usando el ejecutable privado de Apple, vamos a coger la información de el
# # WiFi de la computadora
# CURRENT_WIFI="$(
#   /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I
# )"
#
# # Luego vamos a coger el SSID de la información usando `ripgrep`.
# SSID="$(
#   echo "$CURRENT_WIFI" | \
#   rg -o "SSID: .*" | \
#   sed 's/^SSID: //'
# )"
#
# # Y otro paso más, vamos a coger la tasa de transmisión del WiFi tambien usando
# # `ripgrep`.
# CURR_TX="$(
#   echo "$CURRENT_WIFI" |
#   rg -o "lastTxRate: .*" | \
#   sed 's/^lastTxRate: //'
# )"
#
# # Y al final porque la tasa esta escrita en Megabits la vamos a convertir en
# # Gigabits porque me gusta mejor así. Yo consumo mucho Internet entonces me
# # gusta ver un número más preciso.
# # @desempeño 0.012 segundos
# CURR_TX=$(
#   echo "scale=3; $CURR_TX / 1000" | \
#   bc | \
#   awk '{ printf "%.3f", $0 }'
# )
#
# if [[ -z "$SSID" ]]; then
#   sketchybar --set $NAME label.drawing=off icon=睊
# else
#   sketchybar --set $NAME label.drawing=on label="$SSID (${CURR_TX} Gb/s)" icon=直
# fi

#!/usr/bin/env sh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon=睊
else
  # sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=直
  sketchybar --set $NAME label="$SSID" icon=直
fi
