#!/bin/bash

# This script cleans up the boot partition from unused header and image libraries
# !!! RUN THIS AFTER A REBOOT !!! if you've done an upgrade

KERNEL_RELEASE=`uname -r`
echo "current kernel release $KERNEL_RELEASE"

PROPOSED_FOR_REMOVAL=`dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -v "linux-libc-dev"`
echo "PROPOSED FOR REMOVAL:"
echo $PROPOSED_FOR_REMOVAL

read -r -p "Are you sure? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo $PROPOSED_FOR_REMOVAL | xargs sudo apt-get -y purge
fi

