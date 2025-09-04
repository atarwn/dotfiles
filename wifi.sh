#!/bin/sh

iface="wlan0"

iwctl station "$iface" scan
networks=$(iwctl station "$iface" get-networks | awk 'NR>4 {print $4}' | grep -v "^-*$")
[ -z "$networks" ] && fyi "WiFi: No networks available" && exit 1

ssid=$(printf "%s\n" "$networks" | fuzzel --dmenu --prompt "wifi> " --placeholder "Select WiFi network")
[ -z "$ssid" ] && exit 0

pass=$(fuzzel --dmenu --prompt "password> " --placeholder "Enter WiFi password" --password -l 0 -w 30)

if [ -z "$pass" ]; then
    iwctl station "$iface" connect "$ssid"
else
    iwctl --passphrase "$pass" station "$iface" connect "$ssid"
fi

if [ $? -eq 0 ]; then
    fyi "WiFi: Connected to $ssid"
else
    fyi "WiFi: Error connecting to $ssid"
fi

