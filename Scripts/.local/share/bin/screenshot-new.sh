
# Commands
wofi_command="wofi -l 5 -c ~/.config/wofi/config -s ~/.config/wofi/style.css"
grimblast="grimblast --notify --freeze"

# Buttons
screen="1   󰍹  Capture screen"
area="2  󰩬  Capture area"
window="3    Capture active window"
infive="4  󱑀  Take in 5s"
inten="5  󱑇  Take in 10s"

# Countdown Function
countdown() {
  local seconds=$1

  # Check if notify-send is available (Mako might not be installed on all systems)
  if ! command -v notify-send &> /dev/null; then
    echo "Error: 'notify-send' command not found. Mako might not be installed."
    return 1
  fi

  for sec in $(seq $seconds -1 1); do
    # Create notification content with urgency set to normal (2)
    notify-send "Taking shot in:" "$sec seconds remaining" -u normal
    sleep 1
  done

  # Sleep for 0.1 seconds after the countdown finishes
  sleep 0.1
}

# take shots
shotnow() {
    $grimblast copysave screen
}

shot5() {
    countdown 5
    $grimblast copysave screen
}

shot10() {
    countdown 10
    $grimblast copysave screen
}

shotwin() {
    $grimblast copysave active
}

shotarea() {
    $grimblast copysave area
}

# Variable passed to rofi
options="$screen\n$area\n$window\n$infive\n$inten"

chosen="$(echo -e "$options" | $wofi_command -p 'Take A Shot' -dmenu -selected-row 0)"
sleep 1
case $chosen in
    $screen)
        shotnow
        ;;
    $area)
        shotarea
        ;;
    $window)
        shotwin
        ;;
    $infive)
        shot5
        ;;
    $inten)
        shot10
        ;;
esac
