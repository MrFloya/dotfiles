#!/bin/bash

brightness=$1

echo $brightness > /sys/class/backlight/intel_backlight/brightness 