#!/bin/bash

source "$CONFIG_DIR/colors.sh"

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:19.0"
  icon.color=$Text_Dark_Color
  label.color=$Text_Dark_Color
  background.color=$Battery_Background_Color
  padding_right=0
  padding_left=0
  # label.drawing=off
  label.drawing=on
  update_freq=120
  updates=on
)

sketchybar --add item battery right \
  --set battery "${battery[@]}" \
  --subscribe battery power_source_change system_woke
