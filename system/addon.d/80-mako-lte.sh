#!/sbin/sh
#--------------------------
# Nexus 4 4.3 LTE fix v1.1
#        by *child
#--------------------------

. /tmp/backuptool.functions

case "$1" in
  restore)
    grep -Ev 'telephony.lteOnGsmDevice|ro.telephony.default_network|ro.ril.def.preferred.network' /system/build.prop > /tmp/build.prop
    echo 'telephony.lteOnGsmDevice=1' >> /tmp/build.prop
    echo 'ro.telephony.default_network=10' >> /tmp/build.prop
    echo 'ro.ril.def.preferred.network=10' >> /tmp/build.prop
    mv /tmp/build.prop /system/build.prop
    chmod 644 /system/build.prop

    echo '#!/system/bin/sh
#--------------------------
# Nexus 4 4.3 LTE fix v1.1
#        by *child
#--------------------------

(
sleep 15
iptables -D natctrl_FORWARD -j DROP
iptables -t nat -A natctrl_nat_POSTROUTING -o rmnet_usb0 -j MASQUERADE
)
' > /system/etc/init.d/81makoltetether
    chmod 755 /system/etc/init.d/81makoltetether
  ;;

esac
