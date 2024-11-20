#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    associated_space=$sid
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=5
    icon.padding_right=0
    padding_left=2
    padding_right=2
    # Controll the right padding of a block
    label.padding_right=15
    icon.highlight_color=$SPACE_SELECTED_COLOR
    label.color=$SPACE_UNSELECTED_COLOR
    label.highlight_color=$SPACE_SELECTED_COLOR
    label.font="sketchybar-app-font:Regular:14.0"
    label.y_offset=-1
    background.color=$SPACE_UNSELECTED_BACKGROUND_COLOR
    background.border_color=$SPACE_UNSELECTED_BACKGROUND_BORDER_COLOR
    background.drawing=off
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

spaces_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

separator=(
  icon=􀆊
  icon.font="$FONT:Heavy:14.0"
  padding_left=10
  padding_right=8
  label.drawing=off
  associated_display=active
  click_script='yabai -m space --create && sketchybar --trigger space_change'
  icon.color=$SKY
)

sketchybar --add bracket spaces_bracket '/space\..*/'  \
           --set spaces_bracket "${spaces_bracket[@]}" \
                                                       \
           --add item separator left                   \
           --set separator "${separator[@]}"
