#!/usr/bin/env bash

DEVICE_MAP_DIR=/sdcard/Android/data/com.tomtom.navapp.gosdk/files/maps/bundled/
# DEVICE_MAP_DIR=/sdcard/Android/data/com.tomtom.navapp.gosdk/files/maps/bundled/
DEVICE_KYESTORE_DIR=/sdcard/Android/data/com.tomtom.navapp.gosdk/files/keystores/
# DEVICE_KYESTORE_DIR=/sdcard/Android/data/com.tomtom.navapp.gosdk/files/keystores/

adb install -g -d app-gosdk-debug.apk
adb shell am start -n com.tomtom.navapp.gosdk/com.tomtom.navapp.MainActivity
adb shell "rm -rf ${DEVICE_MAP_DIR}"

sleep 20
adb shell "mkdir -p ${DEVICE_MAP_DIR}"
adb shell "mkdir -p ${DEVICE_KYESTORE_DIR}/00000028"

# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/00000028" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/ROOT.NDS" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

# adb push "/Users/shkliare/Documents/Maps/pl-sk-cz/00000028" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/pl-sk-cz/ROOT.NDS" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/pl-sk-cz/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

# Japan Caruso2 Map
adb push "/Users/shkliare/Documents/Maps/japan_caruso/NDS_AutomotiveReference_2022.12_2.4.6_JPN-Caruso2-0823V1/DATA/00000028" "${DEVICE_MAP_DIR}"
adb push "/Users/shkliare/Documents/Maps/japan_caruso/NDS_AutomotiveReference_2022.12_2.4.6_JPN-Caruso2-0823V1/DATA/00000030" "${DEVICE_MAP_DIR}"
adb push "/Users/shkliare/Documents/Maps/japan_caruso/NDS_AutomotiveReference_2022.12_2.4.6_JPN-Caruso2-0823V1/DATA/ROOT.NDS" "${DEVICE_MAP_DIR}"
adb push "/Users/shkliare/Documents/Maps/japan_caruso/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

adb shell run-as com.tomtom.navapp.gosdk touch /data/data/com.tomtom.navapp.gosdk/files/first-run-wizard-completed
adb shell am force-stop com.tomtom.navapp.gosdk
adb shell am start -n com.tomtom.navapp.gosdk/com.tomtom.navapp.MainActivity

if [ $? -eq 0 ]; then
	echo "Done"
else
	echo "Fail"
fi
