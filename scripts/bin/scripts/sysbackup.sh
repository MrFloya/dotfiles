#!/bin/bash

# Simple script to backup some common places

# packagelist
sh ./pacbackup.sh

# pacman database
sudo tar -cvf /home/florian/backups/pacman-database-new.tar /var/lib/pacman/local
sudo pbzip2 /home/florian/backups/pacman-database-new.tar
sudo rm /home/florian/backups/pacman-database.tar.bz2
sudo mv /home/florian/backups/pacman-database-new.tar.bz2 /home/florian/backups/pacman-database.tar.bz2

# /etc
sudo tar -cvf /home/florian/backups/etc-backup-new.tar /etc
sudo pbzip2 /home/florian/backups/etc-backup-new.tar
sudo rm /home/florian/backups/etc-backup.tar.bz2
sudo mv /home/florian/backups/etc-backup-new.tar.bz2 /home/florian/backups/etc-backup.tar.bz2
