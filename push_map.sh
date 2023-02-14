#!/usr/bin/env bash

DEVICE_MAP_DIR=/sdcard/Android/data/com.tomtom.navapp/files/maps/bundled

function usage {
    echo ""
    echo "To use the script:"
    echo " - sh ./push_map.sh *map path*
    echo ""
}

adb shell "mkdir -p ${DEVICE_MAP_DIR}" || exit 1
if [ $# -ne 2 ]; then
	echo "Wrong number of parameters"
	usage
else
	MAPPATH=$1
	echo "Pushing '${MAPPATH}' to '${DEVICE_MAP_DIR}'"
	adb push "${MAPPATH}/00000028" "${DEVICE_MAP_DIR}"
	adb push "${MAPPATH}/ROOT.NDS" "${DEVICE_MAP_DIR}"
	if [ $? -eq 0 ]; then
		echo "Done"
	else
		echo "Failed to push '${MAPPATH}' to '${DEVICE_MAP_DIR}'"
	fi
fi
