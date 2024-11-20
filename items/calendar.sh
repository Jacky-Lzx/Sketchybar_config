#!/bin/bash

source "$CONFIG_DIR/colors.sh"

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.color=$TEXT_DARK_COLOR
  icon.padding_right=0
  label.width=45
  label.align=right
  label.color=$TEXT_DARK_COLOR
  background.color=$CALENDER_BACKGROUND_COLOR
  padding_left=0
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
