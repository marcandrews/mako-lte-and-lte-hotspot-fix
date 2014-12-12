Nexus 4 LTE Enabler
===================
This will permanently enable LTE on the Nexus 4 running any Android 5.0.1 ROM. As long the hybrid radio is present, and a factory reset is not performed, LTE should remain enabled after reboots and ROM flashes.


## What it does
* Flashes .33/1.05 hybrid radio
* Modifies settings.db to permanently enable LTE


## Requirements
* Custom recovery (permanent or temporary)
* Any Android 5.0.1 ROM
* LTE Band 4 (1700 MHz) AWS-enabled SIM and service provider


## Installation instructions
1. Download the installer ZIP to your device, flash from recovery, and reboot.
2. After flashing, enable your correct LTE APN.
Detailed instructions on on how to flash this on stock Nexus 4 running Android 5.0+ can be found [here](http://forum.xda-developers.com/nexus-4/general/4-4-3-nexus-4-lte-lte-tethering-hotspot-t2416822/post57145811)

## Uninstallation instructions
Please see [uninstaller branch](https://github.com/marcandrews/Mako-LTE-and-LTE-hotspot-fix/tree/uninstaller) for more information.


## More about the enabling LTE via settings.db
As I alluded to [back in July](http://forum.xda-developers.com/showpost.php?p=53825232&postcount=1315), the build.prop edits were never required to enabled LTE.
```
ro.telephony.default_network=9
ro.ril.def.preferred.network=9
```
These lines tell the phone which network mode to try after a factory reset. This is why some LTE-enabling methods asked you to factory reset to enabled LTE but who wants to factory reset just to enabled LTE. So if you're not resetting, these lines have no effect.
```
telephony.lteOnGsmDevice=1
```
This line was to allow the selection of LTE under Network Mode, but this menu is no longer available >4.3, so this line has no effect. It was only indirectly required because that selection menu allowed you to change the ```preferred_network_mode``` value in settings.db, and this is what enables LTE and allows it to stay enabled permanently following a reboot.

So if you can change the ```preferred_network_mode``` value directly, you do not need any build.prop edits, nor do you need the Network Mode selection menu. All you need is ```preferred_network_mode=9``` and an LTE-enabled modem/radio. This is what my LTE-enabler accomplishes.

As for the discussion about LTE sticking after ROM flashes settings.db is located on the data partition. ROM flashable zips rarely touch the data partition, and they also rarely flash a new modem, so as long as these two remain, and you have not wiped (because wiping clears the data partition, which in turn will clear the ```preferred_network_mode``` value), LTE will stick after a ROM flash. So basically, you only need to flash my LTE-enabler after wiping.


## Special thanks
* [XanSama](http://forum.xda-developers.com/showpost.php?p=36544976&postcount=20)
* #netfilter guys at freenode
* [morrislee](http://forum.xda-developers.com/showthread.php?p=43925317)
* [cg87](http://forum.xda-developers.com/showpost.php?p=48237939&postcount=882)
* partylikeaninjastar
* [beerbaronstatic](http://forum.xda-developers.com/showpost.php?p=56762318&postcount=1401)
* ramjet73
* Joshua Mr PC Repair
