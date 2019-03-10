#!/bin/bash

# unload daemon
sudo launchctl unload -w /Library/LaunchDaemons/spoof_startup.plist

# remove plist file
sudo rm /Library/LaunchDaemons/spoof_startup.plist
