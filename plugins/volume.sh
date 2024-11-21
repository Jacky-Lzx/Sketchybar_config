#!/bin/bash

## Lzx: scale the volume by 3 times to avoid ear damage

WIDTH=100

volume_change() {
  source "$CONFIG_DIR/icons.sh"

  volume=$(echo "$INFO * 3" | bc)
  echo $volume
  case $volume in
  [6-9][0-9] | 100)
    ICON=$VOLUME_100
    ;;
  [3-5][0-9])
    ICON=$VOLUME_66
    ;;
  [1-2][0-9])
    ICON=$VOLUME_33
    ;;
  [1-9])
    ICON=$VOLUME_10
    ;;
  0)
    ICON=$VOLUME_0
    ;;
  *) ICON=$VOLUME_100 ;;
  esac

  sketchybar --set volume_icon icon=$ICON

  sketchybar --set $NAME slider.percentage=$volume \
    --animate tanh 30 --set $NAME slider.width=$WIDTH

  sleep 2

  # Check wether the volume was changed another time while sleeping
  FINAL_PERCENTAGE=$(sketchybar --query $NAME | jq -r ".slider.percentage")
  echo "$FINAL_PERCENTAGE - $volume"
  if [ "$FINAL_PERCENTAGE" -eq "$volume" ]; then
    sketchybar --animate tanh 30 --set $NAME slider.width=0
  fi
}

mouse_clicked() {
  osascript -e "set volume output volume $(echo "$PERCENTAGE / 3" | bc)"
}

mouse_entered() {
  sketchybar --set $NAME slider.knob.drawing=on
}

mouse_exited() {
  sketchybar --set $NAME slider.knob.drawing=off
}

case "$SENDER" in
"volume_change")
  volume_change
  ;;
"mouse.clicked")
  mouse_clicked
  ;;
"mouse.entered")
  mouse_entered
  ;;
"mouse.exited")
  mouse_exited
  ;;
esac
