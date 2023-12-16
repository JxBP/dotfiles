#!/bin/sh
# A utility script to mount a LUKS encrypted device.
# Requires cryptsetup(8) to run.
#
# Author: JxBP
# Date: 2022-12-29

if [ "$(id -u)" -ne 0 ]; then
	echo "You must run this script as root!"
	exit 1
fi

USAGE="
Usage $(basename "$0") (mount|umount) [OPTIONS]

Options:
  -m, --mount   The mount point (default: /mnt)
  -d, --drive  The drive to mount (default: /dev/sdb)
"

MAPPING="luks"

mount="/mnt"
drive="/dev/sdb"

while [ "$#" -gt 0 ]; do
	case $1 in
	mount | umount)
		action="$1"
		shift
		;;
	-m | --mount)
		mount="$2"
		shift
		shift
		;;
	-d | --drive)
		drive="$2"
		shift
		shift
		;;
	*)
		echo "Unkown argument: $1"
		echo "$USAGE"
		exit
		;;
	esac
done

if [ "$action" = "mount" ]; then
	cryptsetup luksOpen "$drive" $MAPPING
	mount /dev/mapper/$MAPPING "$mount"
elif [ "$action" = "umount" ]; then
	umount "$mount"
	cryptsetup luksClose /dev/mapper/$MAPPING
else
	echo "$USAGE"
fi
