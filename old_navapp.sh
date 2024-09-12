#!/usr/bin/env bash


temp_dir="Map"
old_navapp_dir="/sdcard/ttndata/files"
nk1_map_dir="/sdcard/Android/data/com.tomtom.navapp/files/maps/bundled"
nk1_keystore_file="/sdcard/Android/data/com.tomtom.navapp/files/keystores/NK_AUTO_DEV.NKS"
navsdk_map_dir="/sdcard/Android/data/com.tomtom.navapp.gosdk/files/maps/bundled"
navsdk_keystore_file="/sdcard/Android/data/com.tomtom.navapp.gosdk/files/keystores/NK_AUTO_DEV.NKS"
download_map_link='https://tomtominternational-my.sharepoint.com/:u:/g/personal/iryna_shkliarenko_tomtom_com/EWrjF3AmVMlMmWkx57wGI5wBizwnFLySFdCHNtQTv3EHHA?download=1'


[ $# -eq 1 ] && adb install "$1" && echo "APK installed successfully!"

adb shell rm -rf $old_navapp_dir
adb shell mkdir -p $old_navapp_dir
# Copy map from AUI NK1 if exists
if adb shell [ -d "${nk1_map_dir}/00000028/" ]; then
	adb shell cp -r "${nk1_map_dir}/00000028/" $old_navapp_dir
	adb shell cp -r "${nk1_map_dir}/ROOT.NDS" $old_navapp_dir
	adb shell cp $nk1_keystore_file "${old_navapp_dir}/keystore.sqlite"
	echo "Copied maps from NK1 AUI"
# Copy map from AUI NavSDK if exists
elif adb shell [ -d "${navsdk_map_dir}/00000028/" ]; then
	adb shell cp -r "${navsdk_map_dir}/00000028/" $old_navapp_dir
	adb shell cp -r "${navsdk_map_dir}/ROOT.NDS" $old_navapp_dir
	adb shell cp $navsdk_keystore_file "${old_navapp_dir}/keystore.sqlite"
	echo "Copied maps from NavSDK AUI"
# Download map from sharepoint
else
	(
        mkdir -p $temp_dir
        cd $temp_dir
        wget $download_map_link -O Poland.zip
        unzip Poland.zip

        adb push 00000028 $old_navapp_dir
        adb push ROOT.NDS $old_navapp_dir
        adb push NK_AUTO_DEV.NKS "${old_navapp_dir}/keystore.sqlite"
		echo "Downloaded Poland map form sharepoint"
    )
	rm -rf $temp_dir
fi
#Maven metadata https://artifactory.tomtom.com/ui/repos/tree/General/navapp-releases/com/tomtom/navui/Products_StockNavApp/maven-metadata.xml
