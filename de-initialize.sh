#!/sbin/sh
grep -Ev 'telephony.lteOnGsmDevice|ro.telephony.default_network|ro.ril.def.preferred.network' /system/build.prop > /tmp/build.prop
mv /tmp/build.prop /system/build.prop
chmod 644 /system/build.prop
