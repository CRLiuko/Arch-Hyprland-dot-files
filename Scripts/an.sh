#!/bin/bash
DIR="${HOME}/Wallpaper"
picture_array=("${DIR}/"*)
picture_array_length=${#picture_array[@]}
random_number=$((RANDOM % ${picture_array_length}))
swww img ${picture_array[random_number]}
echo ${picture_array[random_number]} > ~/.config/hypr/wallpaper.txt
