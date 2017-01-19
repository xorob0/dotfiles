#!/bin/bash

MPC=`mpc | sed -n '2p' | awk '{print $4}'`
PERCENT=${MPC:1: -2}
echo $MPC
echo $PERCENT

if [ $PERCENT -lt 3 ]
then
	mpc prev
else
	mpc seek 0
fi
