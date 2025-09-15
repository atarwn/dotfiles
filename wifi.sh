#!/bin/bash

iface="wlan0"

networks=$(
    iwctl station "$iface" get-networks |
    sed 's/\x1B\[[0-9;]*[A-Za-z]//g; s/\s*\*\*\*\*\s.*//g; $d' |
    awk 'NR>4 {
        sub(/^ *>/,">");
        sec=$NF; $NF="";
        name=$0; sub(/^ +/,"",name);
        print name "\t" sec
    }'
)

choice=$(echo "$networks" | fuzzel --dmenu --prompt "wifi> " --placeholder "Select WiFi" | cut -f1)
sec=$(echo "$networks" | grep -F "$choice" | cut -f2)

if [[ -z "$choice" ]]; then
    fyi "Empty choice" "Not connecting"
    exit 1
fi

ssid=$(echo "$choice" | sed 's/^>\s*//; s/[[:space:]]*$//')

echo "SSID: '$ssid'"
echo "SECURITY: $sec"

if [[ "$choice" =~ ^">" ]]; then
    iwctl station "$iface" disconnect
    fyi "WiFi" "Disconnected from $ssid"
    exit 0
fi

case "$sec" in
    open)
        iwctl station "$iface" connect "$ssid"
        ;;
    psk|sae|wep)
        pass=$(fuzzel --dmenu --prompt "password> " --placeholder "Enter WiFi password" --password -l 0 )
        if [[ -z "$pass" ]]; then
            iwctl station "$iface" connect "$ssid"
        else
            iwctl --passphrase "$pass" station "$iface" connect "$ssid"
        fi
        ;;
    8021x|eap)
        fyi "WiFi" "802.1x/EAP networks require extra setup"
        exit 1
        ;;
    *)
        fyi "WiFi" "Unknown security type: $sec"
        exit 1
        ;;
esac

if [[ $? -eq 0 ]]; then
    fyi "WiFi" "Connected to $ssid"
else
    fyi "WiFi" "Error connecting to $ssid"
fi
