#!/bin/sh

choice=$(printf "exit\nshutdown\nreboot\nsleep\n" | fuzzel --dmenu --prompt "system> " --placeholder "Select action" -l 4)

case "$choice" in
    exit)
        niri msg action quit
        ;;
    shutdown)
        confirm=$(printf "no\nyes" | fuzzel --dmenu --prompt "shutdown?> " --placeholder "Confirm shutdown" -l 2)
        [ "$confirm" = "yes" ] && systemctl poweroff
        ;;
    reboot)
        confirm=$(printf "no\nyes" | fuzzel --dmenu --prompt "reboot?> " --placeholder "Confirm reboot" -l 2)
        [ "$confirm" = "yes" ] && systemctl reboot
        ;;
    sleep)
        confirm=$(printf "no\nyes" | fuzzel --dmenu --prompt "sleep?> " --placeholder "Confirm sleep" -l 2)
        [ "$confirm" = "yes" ] && systemctl suspend
        ;;
esac

