#!/bin/bash

#
# second_plank.sh - Adding capabilities to the Plank dock
#
# Copyright (C) 2023 Nguyen Duy Thanh (segfault.e404). All right reserved
#

FILENAME="/tmp/second_plank_enabled"

if [ -e "$FILENAME" ]; then
	echo "File exists"
	exit
else
	echo "File doesn't exists"

	echo "1" > $FILENAME
	
	plank &
	plank -n dock2 &
	kill $!
	monitor=$(xrandr | grep " connected" | awk '$3 !="primary" { print $1 }')
	gsettings reset-recursively net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock2/
	for key in $(gsettings list-keys net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/); do
    		val=$(gsettings get net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ $key)
    		gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock2/ $key "$val"
	done
	gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock2/ monitor $monitor

	current=$(gsettings get net.launchpad.plank enabled-docks)
	append=$(echo $current | sed "s@dock1@dock1','dock2@g")
	gsettings set net.launchpad.plank enabled-docks "$append"

	mkdir -p $HOME/.config/plank/dock2/
	rm -rf $HOME/.config/plank/dock2/launchers
	ln -s $HOME/.config/plank/dock1/launchers $HOME/.config/plank/dock2/launchers

	killall plank
fi
