Nexus 4 LTE and LTE hotspot/tethering fix uninstaller
=====================================================

Here is the uninstaller for my Nexus 4 LTE and LTE hotspot/tethering fix. Please use this uninstaller to ready your device for official OTA updates.


## What it does
* Flashes 1.02 hybrid radio
* Removes build.prop edits that enable LTE
* Removes init.d script that modifies iptables to fix LTE tethering upon bootup
* Removes addon.d script that maintains build.prop and iptables modifications after ROM updates
* Removes ```tether_dun_required``` fix for tethering on T-Mobile


## Uninstallation instructions
Download the uninstaller ZIP to your device, flash from recovery, and reboot.
