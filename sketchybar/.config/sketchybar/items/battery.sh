#!/bin/zsh

battery=(
  script="$PLUGIN_DIR/battery.sh"
  padding_right=5
  padding_left=0
  label.drawing=off
  update_freq=120
  updates=on
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
