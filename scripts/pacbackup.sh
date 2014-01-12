#!/bin/bash

# Simple script to keep track of pacman's installed package
pacman -Qqe | grep -v "$(pacman -Qqm)" > /home/florian/backups/.pacbackup

