#!/bin/bash

killall memory_load
(cd $CONFIG_DIR/helper/event_providers/memory_load && make)
$CONFIG_DIR/helper/event_providers/memory_load/bin/memory_load memory_update 1.0 >/dev/null 2>&1 &

source "$CONFIG_DIR/colors.sh"

memory_top=(
  label.font="$FONT:Semibold:7"
  label=MEM
  icon.drawing=off
  width=0
  padding_right=30
  y_offset=6
)

memory_percent=(
  label.font="$FONT:Heavy:10"
  label=MEM
  # y_offset=-4
  # padding_right=15
  width=50
  icon.drawing=off
  script="$PLUGIN_DIR/memory.sh"
  # update_freq=4
  # mach_helper="$HELPER"
  background.drawing=off
  padding_right=0
  y_offset=6
  # background.color=$Transparent
)

memory_sys=(
  width=0
  graph.color=$RED
  # graph.fill_color=$RED
  padding_right=-45
  label.drawing=off
  icon.drawing=off
  background.height=10
  background.drawing=on
  background.color=$Transparent
  y_offset=-8
)

sketchybar \
  --add item memory.top right \
  --set memory.top "${memory_top[@]}" \
  \
  --add item memory.percent right \
  --set memory.percent "${memory_percent[@]}" \
  --subscribe memory.percent memory_update \
  \
  --add graph memory.sys right 50 \
  --set memory.sys "${memory_sys[@]}"
