#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

BATTERY_INFO="$(pmset -g batt)"
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATTERY_INFO" | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

DRAWING=on
COLOR=0xffa6e3a1
case ${PERCENTAGE} in
  # 9[0-9]|100) ICON=$BATTERY_100; DRAWING=off
  9[0-9]|100) ICON=$BATTERY_100;
  ;;
  # [6-8][0-9]) ICON=$BATTERY_75; DRAWING=off
  [6-8][0-9]) ICON=$BATTERY_75;
  ;;
  [3-5][0-9]) ICON=$BATTERY_50; COLOR=0xfffab387
  ;;
  [1-2][0-9]) ICON=$BATTERY_25; COLOR=0xfffab387
  ;;
  *) ICON=$BATTERY_0; COLOR=0xfff38ba8
esac

if [[ $CHARGING != "" ]]; then
  ICON=$BATTERY_CHARGING
  # DRAWING=off
fi

sketchybar --set $NAME drawing=$DRAWING icon="$ICON" label="${PERCENTAGE}%" icon.color=$COLOR label.color=$COLOR
