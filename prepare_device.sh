#!/usr/bin/env bash

DEVICE_MAP_DIR=/sdcard/Android/data/com.tomtom.navapp/files/maps/bundled/
DEVICE_KYESTORE_DIR=/sdcard/Android/data/com.tomtom.navapp/files/keystore/

# adb install -g app-navkit1-debug.apk
adb shell am start -n com.tomtom.navapp/.MainActivity

sleep 20

adb shell "mkdir -p ${DEVICE_MAP_DIR}"
adb shell "mkdir -p ${DEVICE_KYESTORE_DIR}"

# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/00000028" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/ROOT.NDS" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

adb push "/Users/shkliare/Documents/Maps/Poland/00000028" "${DEVICE_MAP_DIR}"
adb push "/Users/shkliare/Documents/Maps/Poland/ROOT.NDS" "${DEVICE_MAP_DIR}"
adb push "/Users/shkliare/Documents/Maps/Poland/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

adb shell run-as com.tomtom.navapp touch /data/data/com.tomtom.navapp/files/first-run-wizard-completed
adb shell am force-stop com.tomtom.navapp
adb shell am start -n com.tomtom.navapp/.MainActivity


if [ $? -eq 0 ]; then
	echo "Done"
else
	echo "Fail"
fi
