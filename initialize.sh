#!/sbin/sh
grep -Ev 'telephony.lteOnGsmDevice|ro.telephony.default_network|ro.ril.def.preferred.network' /system/build.prop > /tmp/build.prop
echo 'telephony.lteOnGsmDevice=1' >> /tmp/build.prop
echo 'ro.telephony.default_network=10' >> /tmp/build.prop
echo 'ro.ril.def.preferred.network=10' >> /tmp/build.prop
mv /tmp/build.prop /system/build.prop
chmod 644 /system/build.prop
