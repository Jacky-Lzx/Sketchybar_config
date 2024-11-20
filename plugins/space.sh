#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"

  if [ "$SELECTED" = "true" ]; then
    Background_Border_Color=$Space_Selected_Background_Border_Color
    Background_Color=$Space_Selected_Background_Color
  else
    Background_Border_Color=$Space_Unselected_Background_Border_Color
    Background_Color=$Space_Unselected_Background_Color
  fi

  sketchybar --set $NAME icon.highlight=$SELECTED \
    label.highlight=$SELECTED \
    background.border_color=$Background_Border_Color \
    background.color=$Background_Color
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
*)
  update
  ;;
esac
