#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:19.0"
  icon.color=$TEXT_DARK_COLOR
  label.color=$TEXT_DARK_COLOR
  background.color=$BATTERY_BACKGROUND_COLOR
  padding_right=0
  padding_left=0
  # label.drawing=off
  label.drawing=on
  update_freq=120
  updates=on
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
