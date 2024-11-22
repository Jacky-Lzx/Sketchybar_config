#!/bin/bash

# HELPER=cpu_update
killall cpu_load
(cd $CONFIG_DIR/helper/event_providers/cpu_load && make)
$CONFIG_DIR/helper/event_providers/cpu_load/bin/cpu_load cpu_update 1.0 >/dev/null 2>&1 &

source "$CONFIG_DIR/colors.sh"

cpu_top=(
  label.font="$FONT:Semibold:7"
  label=CPU
  icon.drawing=off
  width=0
  # padding_right=15
  y_offset=6
)

cpu_percent=(
  label.font="$FONT:Heavy:12"
  label=CPU
  y_offset=-4
  # padding_right=15
  width=40
  icon.drawing=off
  script="$PLUGIN_DIR/cpu.sh"
  # update_freq=4
  # mach_helper="$HELPER"
  background.drawing=off
  # background.color=$Transparent
)

cpu_sys=(
  width=0
  graph.color=$RED
  graph.fill_color=$RED
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=off
  # background.color=$Transparent
)

cpu_user=(
  graph.color=$BLUE
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=off
  # background.color=$Transparent
)

sketchybar \
  --add item cpu.top right \
  --set cpu.top "${cpu_top[@]}" \
  \
  --add item cpu.percent right \
  --set cpu.percent "${cpu_percent[@]}" \
  --subscribe cpu.percent cpu_update \
  \
  --add graph cpu.sys rightw 45 \
  --set cpu.sys "${cpu_sys[@]}" \
  \
  --add graph cpu.user right 45 \
  --set cpu.user "${cpu_user[@]}"
