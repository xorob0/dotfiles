#!/bin/bash
# export BORG_PASSPHRASE='this is a terrible idea !'
export BORG_PASSCOMMAND="pass Celty/backups.celty.eu"
export BORG_REPO=root@192.168.1.16:/mnt/HDD1/Backups/

borg create									\
    --verbose                       		\
    --list                          		\
    --stats                         		\
    --show-rc                       		\
    --compression lz4               		\
    --exclude-caches                		\
    --exclude '/home/*/.cache/*'    		\
    --exclude '/var/cache/*'        		\
    --exclude '/var/tmp/*'          		\
    --exclude '/home/*/Virtual Machines'	\
											\
    ::'{hostname}-{now}'            		\
    /etc                            		\
    /home                           		\
    /var                            		\

borg prune                          		\
    --list                          		\
    --prefix '{hostname}-'          		\
    --show-rc                       		\
    --keep-daily    7               		\
    --keep-weekly   4               		\
    --keep-monthly  6               		\

notify-send "Backup successful"
