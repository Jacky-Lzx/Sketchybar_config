#!/bin/bash

# POPUP_SCRIPT="sketchybar -m --set media_ctrl.anchor popup.drawing=toggle"

media_ctrl_anchor=(
  script="$PLUGIN_DIR/media_ctrl.sh"
  label.max_chars=30
  # click_script="$POPUP_SCRIPT"
  # popup.horizontal=on
  # popup.align=center
  # popup.height=150
)

sketchybar --add item media_ctrl.anchor center \
  --set media_ctrl.anchor "${media_ctrl_anchor[@]}" \
  --subscribe media_ctrl.anchor media_change
