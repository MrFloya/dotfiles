#!/bin/sh

# Lower display brightness
echo 150 > /sys/class/backlight/intel_backlight/brightness

# Enable Wlan power management
iwconfig wlp3s0 power on

# Disable Ethernet wake-on-lan
ethtool -s enp2s0f0 wol d

# Set VM writeback timeout
echo 1500 > /proc/sys/vm/dirty_writeback_centisecs

# Turn off NMI watchdog
echo 0 > /proc/sys/kernel/nmi_watchdog

# Enable Intel sound power management
echo Y > /sys/module/snd_hda_intel/parameters/power_save_controller
echo 1 > /sys/module/snd_hda_intel/parameters/power_save

# Enable Intel chipset power management
for DEVICE in /sys/bus/pci/devices/*; do
        [ -d "$DEVICE" ] || continue
        CONTROL="$DEVICE/power/control"
        [ -w "$CONTROL" ] || continue
        echo "auto" > $CONTROL
    done

# Enable USB host controller autosuspend
for DEVICE in /sys/bus/usb*/devices/*; do
        [ -d "$DEVICE" ] || continue
        CONTROL="$DEVICE/power/control"
        [ -w "$CONTROL" ] || continue
        echo "auto" > $CONTROL
    done

# Enable SATA power management 
for DEVICE in /sys/class/scsi_host/*; do
        [ -d "$DEVICE" ] || continue
        CONTROL="$DEVICE/link_power_management_policy"
        [ -w "$CONTROL" ] || continue
        echo "min_power" > $CONTROL
    done

# Start upower
upower