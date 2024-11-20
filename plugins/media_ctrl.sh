#!/bin/bash

update() {
  PLAYING=1
  TRACK="$(nowplaying-cli get title)"
  if [ "$TRACK" != "null" ]; then
    PLAYING=0
    ARTIST="$(nowplaying-cli get artist)"
    MEDIA="$TRACK - $ARTIST"
  fi

  args=()
  if [ $PLAYING -eq 0 ]; then
    args+=(--set media_ctrl.anchor icon="􀑪" label="$MEDIA" drawing=on)
  fi
  sketchybar -m "${args[@]}"
}

routine() {
  case "$NAME" in
  *)
    update
    ;;
  esac
}

case "$SENDER" in
"routine")
  routine
  ;;
"forced")
  exit 0
  ;;
*)
  update
  ;;
esac
