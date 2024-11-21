#!/bin/bash

source "$CONFIG_DIR/colors.sh"

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  padding_left=0
  padding_right=0
  label.drawing=off
  icon.drawing=off
  # background.color=$Volume_Background_Color
  background.color=$Transparent
  # background.border_color=$Volume_Background_Border_Color
  background.border_width=2
  slider.highlight_color=0xfff9e2af
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$Text_Dark_Color
  slider.knob=􀀁
  slider.knob.drawing=off
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=0
  padding_right=0
  icon=$VOLUME_100
  icon.width=20
  icon.align=left
  # icon.padding_left=10
  # icon.padding_right=10
  icon.font="$FONT:Regular:14.0"
  icon.color=$Text_Dark_Color
  background.color=$Transparent
  # background.border_color=$Volume_Background_Border_Color
  # background.border_width=2
  # label.width=25
  label.align=left
  label.font="$FONT:Regular:14.0"
)

status_bracket=(
  background.color=$Volume_Background_Color
  # background.border_color=$Volume_Background_Border_Color
  # background.border_width=2
)

sketchybar --add slider volume right \
  --set volume "${volume_slider[@]}" \
  --subscribe volume volume_change \
  mouse.clicked \
  mouse.entered \
  mouse.exited \
  \
  --add item volume_icon right \
  --set volume_icon "${volume_icon[@]}"

sketchybar --add bracket volume_bracket volume volume_icon \
  --set volume_bracket "${status_bracket[@]}"
