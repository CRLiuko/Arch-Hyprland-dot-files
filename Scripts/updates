#!/bin/bash

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l); then
  updates_arch=0;
fi

if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
  updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
  printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates" }' "$updates" "$updates" "$updates"
else 
  printf '{"text": "0", "alt": "0", "tooltip": "0 Updates"}'
fi
