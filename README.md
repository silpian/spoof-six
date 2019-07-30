# spoof-six

Automatically spoofs your MAC address on boot by choosing (mostly) random six bytes.

*Mostly* - the second four bits are limited to 8 possible digits, but the rest of the 44 bits have the full hexadecimal range

## Automated
Setup:
```
git clone https://github.com/silpian/spoof-six.git
cd spoof-six/launch_on_boot
chmod u+x ./load_daemon.sh
./load_daemon.sh
```

To remove the daemon:
```
# If you haven't already run load_daemon.sh, you will need to make the remove_deamon.sh executable before running it:
# chmod u+x ./remove_deamon.sh

./remove_daemon.sh
```

## Manual
```
git clone https://github.com/silpian/spoof-six.git
cd spoof-six
chmod u+x ./spoof.sh
./spoof.sh
```
