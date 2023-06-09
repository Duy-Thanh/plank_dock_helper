#! /bin/env bash

#
# dock.sh - Adding capabilities to the Plank dock
#
# Copyright (C) 2023 Nguyen Duy Thanh (segfault.e404). All right reserved
#

sleep 5

### RETRIEVE CURRENT SETTINGS ###

PRIMARY_DISPLAY=$(xrandr | grep " connected" | awk '$3 =="primary" { print $1 }')
SECONDARY_DISPLAY=$(xrandr | grep " connected" | awk '$3 !="primary" { print $1 }')
SECONDARY_DISPLAY_RESOLUTION=$(xrandr | grep " connected" | awk '$3 !="primary" { print $3 }')

SECONDARY_DISPLAY_INACTIVE=$(echo "(normal")

DOCK_ENABLED_STATUS=$(gsettings get net.launchpad.plank enabled-docks)
DOCK_SECONDARY_DISABLED=$(echo "['dock1']")
DOCK_SECONDARY_ENABLED=$(echo "['dock1', 'dock2']")

FILENAME="/tmp/second_plank_enabled"
FILE_CONTENT=$(cat $FILENAME)

INTERVAL=5

plank &

while true; do
	### RETRIEVE CURRENT SETTINGS ###

	PRIMARY_DISPLAY=$(xrandr | grep " connected" | awk '$3 =="primary" { print $1 }')
	SECONDARY_DISPLAY=$(xrandr | grep " connected" | awk '$3 !="primary" { print $1 }')
	SECONDARY_DISPLAY_RESOLUTION=$(xrandr | grep " connected" | awk '$3 !="primary" { print $3 }')

	SECONDARY_DISPLAY_INACTIVE=$(echo "(normal")

	DOCK_ENABLED_STATUS=$(gsettings get net.launchpad.plank enabled-docks)
	DOCK_SECONDARY_DISABLED=$(echo "['dock1']")
	DOCK_SECONDARY_ENABLED=$(echo "['dock1', 'dock2']")

	FILENAME="/home/${USER}/.config/second_plank_enabled"
	FILE_CONTENT=$(cat $FILENAME)

	if [ "$SECONDARY_DISPLAY" == "" ]; then
		if [ "$DOCK_ENABLED_STATUS" == "$DOCK_SECONDARY_ENABLED" ]; then
			./disable_second.sh
			killall plank
			plank &
		fi
	else
		if [ "$SECONDARY_DISPLAY" == "$PRIMARY_DISPLAY" ]; then
			if [ "$DOCK_ENABLED_STATUS" == "$DOCK_SECONDARY_ENABLED" ]; then
				./disable_second.sh
				killall plank
				plank &
			fi
		else
			if [ "$SECONDARY_DISPLAY_RESOLUTION" == "$SECONDARY_DISPLAY_INACTIVE" ]; then
				if [ "$DOCK_ENABLED_STATUS" == "$DOCK_SECONDARY_ENABLED" ]; then
					./disable_second.sh
					killall plank
					plank &
				fi
			else
				if [ "$DOCK_ENABLED_STATUS" == "$DOCK_SECONDARY_DISABLED" ]; then
					if [ -e "$FILENAME" ]; then
						if [ "$CONTENT" != "1" ]; then
							rm -rf $FILENAME
							FILE_CONTENT=
							./second_plank.sh
							killall plank
							plank &
						else
							./enable_second.sh
							killall plank
							plank &
						fi
					else
						./second_plank.sh
						./enable_second.sh
						killall plank
						plank &
					fi
				fi
			fi
		fi
	fi

	# Sleep for the specific interval
	sleep $INTERVAL
done &
