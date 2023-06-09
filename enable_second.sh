#! /bin/env bash

#
# enable_second.sh - Sub-script to enable display Plank dock on the second screen
#
# Copyright (C) 2023 Nguyen Duy Thanh (segfault.e404). All right reserved
#

plank &
plank -n dock2 &
gsettings set net.launchpad.plank enabled-docks "['dock1', 'dock2']"
killall plank
