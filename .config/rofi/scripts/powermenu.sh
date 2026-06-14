#!/bin/bash

#!/bin/bash

options="  Lock\n  Logout\n  Suspend\n  Hibernate\n  Reboot\n  Shutdown\n Performance\n Balanced\n Power Saver "

selected=$(echo -e "$options" | rofi -dmenu -i -p "Power" -matching fuzzy)

case $selected in
    *Lock)      swaylock --config $HOME/.config/swaylock/config ;;
    *Logout)    swaymsg exit ;;
    *Suspend)   systemctl suspend ;;
    *Hibernate) systemctl hibernate ;;
    *Reboot)    systemctl reboot ;;
    *Shutdown)  systemctl poweroff ;;
    *Performance) powerprofilesctl set performance ;;
    *Balanced)    powerprofilesctl set balanced ;;
    *Power\ Saver) powerprofilesctl set power-saver ;;
esac

