#!/usr/bin/env bash

DEVICE_MAP_DIR=/sdcard/Android/data/com.tomtom.navkit2ui/files/map
DEVICE_KYESTORE_DIR=/sdcard/Android/data/com.tomtom.navkit2ui/files/keystores

function usage {
    echo ""
    echo "To use the script:"
    echo " - sh ./push_map.sh *map path* *key path*"
    echo ""
}

adb shell "mkdir -p ${DEVICE_MAP_DIR}" || exit 1
if [ $# -ne 2 ]; then
	echo "Wrong number of parameters"
	usage
else
	MAPPATH=$1
	KEYPATH=$2
	echo "Pushing '${MAPPATH}/DATA/.' to '${DEVICE_MAP_DIR}'"
	adb push "${MAPPATH}/DATA/." "${DEVICE_MAP_DIR}"
	if [ $? -eq 0 ]; then
		echo "Done"
	else
		echo "Failed to push '${MAPPATH}' to '${DEVICE_MAP_DIR}'"
	fi
	echo "Pushing '${KEYPATH}' to '${DEVICE_KYESTORE_DIR}'"
	adb push "${KEYPATH}" "${DEVICE_KYESTORE_DIR}"
	if [ $? -eq 0 ]; then
		echo "Done"
	else
		echo "Failed to push '${KEYPATH}' to '${DEVICE_KYESTORE_DIR}'"
	fi
fi
