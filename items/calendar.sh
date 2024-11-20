#!/bin/bash

source "$CONFIG_DIR/colors.sh"

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.color=$Text_Dark_Color
  icon.padding_right=0
  label.width=45
  label.align=right
  label.color=$Text_Dark_Color
  background.color=$Calender_Background_Color
  padding_left=0
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right \
  --set calendar "${calendar[@]}" \
  --subscribe calendar system_woke
