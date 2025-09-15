#!/bin/bash

CONFIG="$HOME/.config/yambar/config.yml"

if grep -q "foreground: cdd6f4ff" "$CONFIG"; then
    # если сейчас стоит светлое значение → меняем на тёмное
    sed -i 's/foreground: cdd6f4ff/foreground: 1e1e2eff/' "$CONFIG"
elif grep -q "foreground: 1e1e2eff" "$CONFIG"; then
    # если сейчас тёмное → меняем на светлое
    sed -i 's/foreground: 1e1e2eff/foreground: cdd6f4ff/' "$CONFIG"
else
    echo "⚠ Не найдено ни одно из ожидаемых значений в $CONFIG"
    exit 1
fi

# перезапускаем yambar, если нужно
pkill -USR1 yambar 2>/dev/null
yambar &
