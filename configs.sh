#!/bin/bash
source "$CONFIG_DIR/colors.sh"

FONT="SF Pro" # Needs to have Regular, Bold, Semibold, Heavy and Black variants
PADDINGS=3    # All paddings use this value (icon, label, background)

bar=(
  height=26
  color=$Bar_Color
  blur_radius=30
  border_width=0
  border_color=$Bar_Border_Color
  corner_radius=0
  shadow=off
  position=top
  sticky=on
  padding_right=0
  padding_left=0
  y_offset=4
  margin=10
)

defaults=(
  updates=when_shown
  icon.font="$FONT:Bold:14.0"
  icon.color=$ICON_COLOR
  icon.padding_left=$PADDINGS
  icon.padding_right=$PADDINGS
  label.font="$FONT:Semibold:13.0"
  label.color=$LABEL_COLOR
  label.padding_left=$PADDINGS
  label.padding_right=$PADDINGS
  padding_right=$PADDINGS
  padding_left=$PADDINGS
  background.height=22
  background.corner_radius=0
  background.border_width=0
  background.color=$Background_Color
  popup.background.corner_radius=2
  popup.background.border_width=2
  popup.background.border_color=$POPUP_BORDER_COLOR
  popup.background.color=$Nowplaying_Popup_Background_Color
  popup.blur_radius=20
  popup.background.shadow.drawing=on
)
