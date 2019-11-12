#!/bin/bash

DEVICE=${1:-"00:16:94:22:8C:9B"}

echo "power on" | bluetoothctl &> /dev/null

paired="$(bluetoothctl info ${DEVICE} | grep 'Connected: yes')"
if [ -n "$paired" ]; then
    echo "Device ${DEVICE} already connected! Exiting.."
    exit
fi

echo "Connecting to ${DEVICE}. This may take a few seconds. Hit CTRL+C to exit.."
while [ -z "$paired" ]; do
    echo "connect $DEVICE" | bluetoothctl &>/dev/null
    sleep 2s
    paired="$(bluetoothctl info ${DEVICE} | grep 'Connected: yes')"
done
