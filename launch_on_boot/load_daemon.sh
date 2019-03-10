#!/bin/bash

chmod +x ./spoof.sh
chmod +x ./remove_daemon.sh

# write daemon plist file to /Library/LaunchDaemons
plist="<plist version="1.0">\n<dict>\n<key>Label</key>\n<string>spoof_startup</string>\n<key>RunAtLoad</key>\n<true />\n<key>Program</key>\n<string>$(pwd)/spoof.sh</string>\n</dict>\n</plist>"

echo -e $plist | sudo tee /Library/LaunchDaemons/spoof_startup.plist > /dev/null

# load daemon
sudo launchctl load -w /Library/LaunchDaemons/spoof_startup.plist
