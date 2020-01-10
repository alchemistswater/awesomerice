#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
run sxhkd
run mpd
run ckb-next
run steam
run nextcloud
run kdeconnect-indicator
run picom
