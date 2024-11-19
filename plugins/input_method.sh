#!/usr/bin/env bash
source "$CONFIG_DIR/colors.sh"

method=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' |sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/')

if [[ $method != "" ]]; then
  sketchybar -m --set input_method \
                          icon=""\
                          label="en" \
                          icon.drawing=off \
                          drawing=on \
                          label.color=$BLUE \
                          icon.color=$BLUE
else
  sketchybar -m --set input_method icon="󰘳" label="cn" drawing=on icon.drawing=on label.color=0xfffab387 icon.color=0xfffab387
fi
