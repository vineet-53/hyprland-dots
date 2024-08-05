#!/bin/sh
#https://github.com/vineet-53

# Set the path to your wallpapers directory

wallpapersDir="$HOME/Pictures/Wallpapers/Slideshow/"

# Get all image files in the directory

wallpapers=("$wallpapersDir"/*)


# Function to check if array is empty and refill it

check_and_refill_wallpapers() {

  if [ ${#wallpapers[@]} -eq 0 ]; then

    wallpapers=("$wallpapersDir"/*)

  fi

}

set_wall() {

  selectedWallpaper="${wallpapers[$1]}"

  swww img --transition-step=255  "$selectedWallpaper"

  echo "$1" > index.txt


}


# Function to handle previous/next wallpaper logic

change_wallpaper() {

  local new_index


  # Check if wallpapers array is empty

  check_and_refill_wallpapers


  # Get current index

  current_index=$(cat ./index.txt)
  if [ "$((current_index - 1))" -le 0 ] || [ "$((current_index + 1))" -ge "${#wallpapers[@]}" ]; then
    exit 0  # or return if in a function
  fi

  if [[ "$1" == "--next" ]]; then

    new_index=$((current_index + 1))

    set_wall $new_index

  elif [[ "$1" == "--prev" ]]; then

    new_index=$((current_index - 1))

    set_wall $new_index

  else

    echo "Invalid args use --prev or --next"

    exit 1

  fi

}
change_wallpaper "$1"
