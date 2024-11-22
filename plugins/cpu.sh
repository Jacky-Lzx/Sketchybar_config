#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

cpu_update() {
  USER_LOAD="0.$user_load"
  SYS_LOAD="0.$sys_load"

  LOAD_COLOR=$Text_Light_Color
  case $total_load in
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

  sketchybar --push cpu.sys $SYS_LOAD
  sketchybar --push cpu.user $USER_LOAD
  sketchybar --set cpu.percent label="$total_load%" label.color="$LOAD_COLOR"
}

case "$SENDER" in
"cpu_update")
  cpu_update
  ;;
esac
