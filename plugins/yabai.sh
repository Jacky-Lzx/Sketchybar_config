#!/bin/bash

source $CONFIG_DIR/plugins/icon_map.sh

window_state() {
  source "$CONFIG_DIR/colors.sh"
  source "$CONFIG_DIR/icons.sh"

  WINDOW=$(yabai -m query --windows --window)
  STACK_INDEX=$(echo "$WINDOW" | jq '.["stack-index"]')

  COLOR=$BAR_BORDER_COLOR
  ICON=""

  if [ "$(echo "$WINDOW" | jq '.["is-floating"]')" = "true" ]; then
    ICON+=$YABAI_FLOAT
    COLOR=$MAGENTA
  elif [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
    ICON+=$YABAI_FULLSCREEN_ZOOM
    COLOR=$GREEN
  elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
    ICON+=$YABAI_PARENT_ZOOM
    COLOR=$BLUE
  elif [[ $STACK_INDEX -gt 0 ]]; then
    LAST_STACK_INDEX=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    ICON+=$YABAI_STACK
    LABEL="$(printf "[%s/%s]" "$STACK_INDEX" "$LAST_STACK_INDEX")"
    COLOR=$RED
  fi

  args=(--animate sin 10 --bar border_color=$COLOR
    --set $NAME icon.color=$COLOR)

  [ -z "$LABEL" ] && args+=(label.width=0) ||
    args+=(label="$LABEL" label.width=40)

  [ -z "$ICON" ] && args+=(icon.width=0) ||
    args+=(icon="$ICON" icon.width=30)

  sketchybar -m "${args[@]}"
}

windows_on_spaces() {
  CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  args=(--set spaces_bracket drawing=off
    --set '/space\..*/' background.drawing=on
    --animate sin 10)

  while read -r line; do
    for space in $line; do
      icon_strip=" "
      # apps=$(yabai -m query --windows --space $space | jq -r ".[].app")
      # LZX
      # Trying to remove in-visible windows
      # apps=$(yabai -m query --windows --space $space | jq -r '.[] | select(.["split-child"]!="none") | .["app"]')
      apps=$(yabai -m query --windows --space $space | jq -r '.[] | select(.["split-child"]!="none" or .["is-floating"]==true) | .["app"]')
      if [ "$apps" != "" ]; then
        while IFS= read -r app; do
          __icon_map_lzx "$app"
          icon_strip+="${icon_result}"
        done <<<"$apps"
      fi
      args+=(--set space.$space label="$icon_strip" label.drawing=on)
    done
  done <<<"$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  yabai -m window --toggle float
  echo "mouse_clicked"
  window_state
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
"forced")
  exit 0
  ;;
"window_focus")
  window_state
  ;;
"windows_on_spaces" | "space_change")
  windows_on_spaces
  ;;
esac
