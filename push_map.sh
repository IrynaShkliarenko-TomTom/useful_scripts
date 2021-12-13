#!/usr/bin/env bash

DEVICE_MAP_DIR=/sdcard/Android/data/com.tomtom.navkit2ui/files/map

adb shell "mkdir -p ${DEVICE_MAP_DIR}" || exit 1
if [ $# -ne 1 ]; then
	echo "Wrong number of parameters"
else
	MAPPATH=$1
	echo "Pushing '${MAPPATH}/DATA/.' to '${DEVICE_MAP_DIR}'"
	adb push "${MAPPATH}/DATA/." "${DEVICE_MAP_DIR}"
	if [ $? -eq 0 ]; then
		echo "Done"
	else
		echo "Failed to push '${MAPPATH}' to '${DEVICE_MAP_DIR}'"
	fi
fi

