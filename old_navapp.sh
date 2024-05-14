#!/usr/bin/env bash

adb shell mkdir -p /sdcard/ttndata/files
adb shell cp -r /sdcard/Android/data/com.tomtom.navapp/files/maps/bundled/00000028/ /sdcard/ttndata/files
adb shell cp -r /sdcard/Android/data/com.tomtom.navapp/files/maps/bundled/ROOT.NDS /sdcard/ttndata/files
adb shell cp /sdcard/Android/data/com.tomtom.navapp/files/keystores/NK_AUTO_DEV.NKS /sdcard/ttndata/files/keystore.sqlite