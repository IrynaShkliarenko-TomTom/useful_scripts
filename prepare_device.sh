#!/usr/bin/env bash

DEVICE_MAP_DIR=/sdcard/Android/data/com.tomtom.navapp/files/maps/bundled/
DEVICE_KYESTORE_DIR=/sdcard/Android/data/com.tomtom.navapp/files/keystores/

adb install -g app.apk
adb shell am start -n com.tomtom.navapp/.MainActivity
adb shell "rm -rf ${DEVICE_MAP_DIR}"

sleep 20
adb shell "mkdir -p ${DEVICE_MAP_DIR}"
adb shell "mkdir -p ${DEVICE_KYESTORE_DIR}"

# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/00000028" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/ROOT.NDS" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/world_map/bundled/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

adb push "/Users/shkliare/Documents/Maps/Poland/00000028" "${DEVICE_MAP_DIR}"
adb push "/Users/shkliare/Documents/Maps/Poland/ROOT.NDS" "${DEVICE_MAP_DIR}"
adb push "/Users/shkliare/Documents/Maps/Poland/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

# Japan Caruso2 Map
# adb push "/Users/shkliare/Documents/Maps/japan_caruso/NDS_AutomotiveReference_2022.12_2.4.6_JPN-Caruso2-0823V1/DATA/00000028" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/japan_caruso/NDS_AutomotiveReference_2022.12_2.4.6_JPN-Caruso2-0823V1/DATA/00000030" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/japan_caruso/NDS_AutomotiveReference_2022.12_2.4.6_JPN-Caruso2-0823V1/DATA/ROOT.NDS" "${DEVICE_MAP_DIR}"
# adb push "/Users/shkliare/Documents/Maps/japan_caruso/NK_AUTO_DEV.NKS" "${DEVICE_KYESTORE_DIR}"

adb shell run-as com.tomtom.navapp touch /data/data/com.tomtom.navapp/files/first-run-wizard-completed
adb shell am force-stop com.tomtom.navapp
adb shell am start -n com.tomtom.navapp/.MainActivity

if [ $? -eq 0 ]; then
	echo "Done"
else
	echo "Fail"
fi
