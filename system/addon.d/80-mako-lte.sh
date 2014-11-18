#!/sbin/sh
# Nexus 4 LTE and LTE hotspot/tethering fix

. /tmp/backuptool.functions

case "$1" in
  restore)
    echo '#!/system/bin/sh
# Nexus 4 LTE and LTE hotspot/tethering fix

(
  sleep 15
  iptables -D natctrl_FORWARD -j DROP
  iptables -t nat -A natctrl_nat_POSTROUTING -o rmnet_usb0 -j MASQUERADE
)
' > /system/etc/init.d/81makoltetether
    chmod 755 /system/etc/init.d/81makoltetether
  ;;

esac
