#!/bin/bash

PERCENTAGES=(50 20 15 10 5)
NOTIFIED=""

while true; do
  status=$(acpi -b | awk '{print $3}' | tr -d ',')
  perc=$(acpi -b | awk '{print $4}' | tr -d '%,')
  
  if [[ "$status" == "Discharging" ]]; then
    for p in "${PERCENTAGES[@]}"; do
      if [[ "$perc" -eq "$p" && "$NOTIFIED" != *"$p"* ]]; then
        fyi -u critical "Заряд: $perc%"
        NOTIFIED+="$p "
      fi
    done
  else
    NOTIFIED=""
  fi

  sleep 60
done

