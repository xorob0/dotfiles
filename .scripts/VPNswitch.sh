#!/bin/bash

cd /etc/openvpn/client/
files=(*)
signal=KILL

while true; do
    # Note: command launched in background:
    sudo openvpn "${files[RANDOM % ${#files[@]}]}"


    # Save PID of command just launched:
    last_pid=$!

    # Sleep for a while:
    sleep 10

    # See if the command is still running, and kill it and sleep more if it is:
    if ps -p $last_pid -o comm= | grep 'openvpn'; then
        kill -$signal $last_pid 2> /dev/null
        sleep 10
    fi

    # Go back to the beginning and launch the command again
done
