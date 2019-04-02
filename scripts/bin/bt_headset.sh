#!/bin/bash

HEADSET=${1:-"00:16:94:22:8C:9B"}

{
    echo "power on"
    echo "connect $HEADSET"
    sleep 5s
} | bluetoothctl &>/dev/null
