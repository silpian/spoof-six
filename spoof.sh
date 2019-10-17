#!/bin/bash

# disconnect from network
echo "Disconnect from current network"
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z

# display physical address
physical_address=$(ifconfig en0 | grep ether | awk '{print $2}')
echo "Current address: $physical_address"
if [ "$#" -ne 0 ]; then
    new_six=$1
else
    # new six bytes for mac address
    allowed_four_bits=(0 2 4 6 8 a c e)
    # random four bits allowed for second digit
    random_four_bits=$(echo ${allowed_four_bits[$(jot -r 1 0 $((${#allowed_four_bits[@]} - 1)))]})
    new_six=$(openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/./$random_four_bits/2; s/.$//")
fi

sudo ifconfig en0 ether $new_six

echo "Changing MAC address"
echo "Intended new address: $new_six"
echo "Running 'ifconfig en0 | grep ether' to confirm:"
ifconfig en0 | grep ether

# reset network
echo "Resetting network"
sudo networksetup -setnetworkserviceenabled Wi-Fi off
sudo networksetup -setnetworkserviceenabled Wi-Fi on
#networksetup -setairportpower en0 off
#networksetup -setairportpower en0 on

