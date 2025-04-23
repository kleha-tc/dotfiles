#!/bin/sh -u

wezterm start --class Floaterm nvim /tmp/clip || exit 1
if [[ -e /tmp/clip ]]; then
  head -c -1 /tmp/clip | xclip -selection clipboard
  notify-send -t 1000 copied
  rm -f /tmp/clip
fi
