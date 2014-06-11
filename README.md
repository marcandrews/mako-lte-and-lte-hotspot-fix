Nexus 4 LTE and LTE hotspot/tethering fix
=========================================

Here is my Nexus 4 LTE and LTE hotspot/tethering fix. This is different from other fixes available in that, in addition, it should enable tethering/Wi-Fi portable hotspot over LTE for all service providers.


## What it does
* Flashes .33/1.02 hybrid radio
* Modifies build.prop to permanently enable LTE
* Adds init.d script that modifies iptables to fix LTE tethering upon bootup
* Adds addon.d script that maintains build.prop and iptables modifications after ROM updates
* Adds ```tether_dun_required``` fix for tethering on T-Mobile


## Requirements
Any **rooted 4.4.3 ROM with init.d support**, like CM, AOSPA, or modified stock and, of course, an LTE Band 4 AWS-enabled SIM and service provider.


## Installation instructions
1. Download the installer ZIP to your device, flash from recovery, and reboot.
2. After flashing, enable your correct LTE APN.
3. Enable LTE by going to *Settings* > *More...* under *Wireless & networks* > *Mobile networks* > *Network Mode* and select **LTE/GSM/WCDMA**. It may take a minute or two for the network and LTE to register.
  1. If the previous menu option is unavailable or if your LTE network fails to register, dial `*#*#INFO#*#*`, select *Phone information*, scroll down and select **LTE/GSM/CDMA auto (PRL)** from the drop-down.


## Uninstallation instructions
Please see [uninstaller branch](https://github.com/marcandrews/Mako-LTE-and-LTE-hotspot-fix/tree/uninstaller) for more information.


## More about the LTE tethering fix
Since the Nexus 4 LTE hack was discovered, people on networks other then T-Mobile have been struggling to enable tethering over LTE. Pre-4.3, the solution was an iptables script to allow LTE tethering through the firewall. This solution no longer works for 4.3+. I have updated the script to allow LTE tethering through the firewall in 4.3+. My LTE fix applies the following changes:
```
iptables -D natctrl_FORWARD -j DROP
iptables -t nat -A natctrl_nat_POSTROUTING -o rmnet_usb0 -j MASQUERADE
```
The other issue is that this script had to be run each and every boot. Placing the commands within an init.d script does not work because at the time init.d scripts are run in the boot, the natctrl_nat_POSTROUTING rule does not exist, so you cannot append to it. Even if you do create the rule and append to it, the changes will be overwritten when the rules are set later in the boot. The solution is to run the commands within a delayed subshell that alters the firewall after the rules are set. This is what my LTE fix does:
```
(
  sleep 15
  iptables -D natctrl_FORWARD -j DROP
  iptables -t nat -A natctrl_nat_POSTROUTING -o rmnet_usb0 -j MASQUERADE
)
```

Finally, the ```tether_dun_required = 0``` fix is including to help with tethering on T-Mobile.


## Special thanks
* [XanSama](http://forum.xda-developers.com/showpost.php?p=36544976&postcount=20)
* #netfilter guys at freenode
* [morrislee](http://forum.xda-developers.com/showthread.php?p=43925317)
* [cg87](http://forum.xda-developers.com/showpost.php?p=48237939&postcount=882)
* partylikeaninjastar
