#!/bin/sh

iface="wlan0"

iwctl station "$iface" scan
# Extract network names using awk, handling spaces and the connected marker
networks=$(iwctl station wlan0 get-networks | sed 's/\x1B\[[0-9;]*[A-Za-z]//g' \
  | awk 'NR>4 { match($0, /^(.*)psk/,a); if (a[1]!="") print substr(a[1],7) }')

[ -z "$networks" ] && echo "WiFi: No networks available" && exit 1

ssid=$(printf "%s\n" "$networks" | fuzzel -w 100 --dmenu --prompt "wifi> " --placeholder "Select WiFi network")
[ -z "$ssid" ] && exit 0

pass=$(fuzzel --dmenu --prompt "password> " --placeholder "Enter WiFi password" --password)

if [ -z "$pass" ]; then
    iwctl station "$iface" connect "$ssid"
else
    iwctl --passphrase "$pass" station "$iface" connect "$ssid"
fi

if [ $? -eq 0 ]; then
    echo "WiFi: Connected to $ssid"
else
    echo "WiFi: Error connecting to $ssid"
fi
