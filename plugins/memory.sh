#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

memory_update() {
  # USER_LOAD="0.$user_load"
  # SYS_LOAD="0.$sys_load"
  # MEM_LOAD="$used_percentage%"

  LOAD_COLOR=$Text_Light_Color
  PERCENTAGE=$used_percentage
  case $PERCENTAGE in
  [0-4][0-9])
    # LOAD_COLOR=$Catppuccin_Mocha_Green
    LOAD_COLOR=$Text_Light_Color
    ;;
  [5-7][0-9])
    LOAD_COLOR=$Catppuccin_Mocha_Yellow
    ;;
  [8-9][0-9])
    LOAD_COLOR=$Catppuccin_Mocha_Red
    ;;
  esac

  sketchybar --push memory.sys "0.$used_percentage"
  sketchybar --set memory.percent label="$used_percentage%" label.color="$LOAD_COLOR"
}

case "$SENDER" in
"memory_update")
  memory_update
  ;;
esac
