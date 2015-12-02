#!/bin/bash

# bat_check.sh 
# script to check for depleting battery (execute as autorun)

capacity=$(cat /sys/class/power_supply/BAT0/charge_full)
threshold=$(echo "$capacity * 0.1" | bc -l)
critical=$(echo "$capacity * 0.05" | bc -l)

err_string='naughty.notify({
	title = "Warning!", 
	text = "Battery charge low! Plug in AC adapter or shutdown to prevent data loss!"
})'

while :
do
	current_charge=$(cat /sys/class/power_supply/BAT0/charge_now)

	# if current_charge is below threshold -> show notification via naughty
	[[ $current_charge < $threshold ]] && echo $err_string | awesome-client -
 
	# if current charge is below critical -> shutdown system
	[[ $current_charge < $critical ]] && poweroff

	# sleep 1 minute to preserve battery and check again ;)
	sleep 1m
done