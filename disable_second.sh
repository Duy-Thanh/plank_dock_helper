#! /bin/env bash

#
# disable_second.sh - Sub-script to disable display Plank dock on the second screen
#
# Copyright (C) 2023 Nguyen Duy Thanh (segfault.e404). All right reserved
#

plank &
plank -n dock2 &
gsettings set net.launchpad.plank enabled-docks "['dock1']"
killall plank
