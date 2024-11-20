#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  BACKGROUND_BORDER_COLOR=$SPACE_UNSELECTED_BACKGROUND_BORDER_COLOR
  BACKGROUND_COLOR=$SPACE_UNSELECTED_BACKGROUND_COLOR
  if [ "$SELECTED" = "true" ]; then
    BACKGROUND_BORDER_COLOR=$SPACE_SELECTED_BACKGROUND_BORDER_COLOR
    BACKGROUND_COLOR=$SPACE_SELECTED_BACKGROUND_COLOR
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
                         background.border_color=$BACKGROUND_BORDER_COLOR \
                         background.color=$BACKGROUND_COLOR
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

echo "spaces: $SENDER"
case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
