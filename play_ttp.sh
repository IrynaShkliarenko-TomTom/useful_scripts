#!/usr/bin/env bash

# DEVICE_TTP_DIR=/sdcard/Android/data/com.tomtom.navapp/files/
DEVICE_TTP_DIR=/sdcard/Android/data/com.tomtom.navapp.gosdk/files/

function usage {
    echo ""
    echo "To play the route:"
    echo "./play_ttp.sh <path to .ttp file>"
	echo "To stop playing the route:"
	echo "./play_ttp.sh stop"
    echo ""
}

if [ $# -ne 1 ]; then
	usage
else
    if [ "$1" == stop ]; then
        echo "Sending stop to '${PACKAGE}/com.tomtom.positioning.player.Player'"
		adb shell am startservice -n com.tomtom.navapp/com.tomtom.positioning.player.Player -a com.tomtom.positioning.player.STOP
	else
		TTP_PATH=$1
		echo ${TTP_PATH}
		echo "Pushing '${TTP_PATH}' to '${DEVICE_TTP_DIR}'"
		adb push "${TTP_PATH}" "${DEVICE_TTP_DIR}"
		echo "Playing the file"
		adb shell am startservice -n com.tomtom.navapp/com.tomtom.positioning.player.Player -a com.tomtom.positioning.player.START -e 'log_file' ${DEVICE_TTP_DIR}/route.ttp
	fi
fi