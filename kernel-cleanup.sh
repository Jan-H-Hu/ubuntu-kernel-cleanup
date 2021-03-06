#!/bin/bash

# This script purges unused kernel header and image packages
# !!! RUN THIS AFTER A REBOOT !!! if you've just done an upgrade

KERNEL_RELEASE=`uname -r`
echo "current kernel release $KERNEL_RELEASE"

PROPOSED_FOR_REMOVAL=`dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -v -E "linux-libc-dev|-hwe-"`

if [ -n "$PROPOSED_FOR_REMOVAL" ]
then
    echo "PROPOSED FOR REMOVAL:"
    echo $PROPOSED_FOR_REMOVAL

    read -r -p "Are you sure? [y/N] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
    then
	    echo $PROPOSED_FOR_REMOVAL | xargs sudo apt-get -y purge
    fi
else
    echo "NOTHING TO REMOVE!"
fi

