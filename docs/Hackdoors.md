# Hackdoors #
__Hackdoors__ are the most integral part of Hack Doom.  They guard progression and are unable to be opened by Marines, only by Control.  When Control completes Core challenges they will be able to open the Hackdoors, clearing the way for Marines to complete levels.

# Level Editing #
Hackdoors rely on having appropriately themed doors that lock progression to new Areas of the map.  The style may be unique for every map but for players' sanity should all look identical and unique to everything else in the level.  Hackdoors are Doors but should not respond to any player input (use, shoot, or otherwise interact with).

# Tags #
Hackdoors __must__ be tagged with an appropriate sector tag. Every Hackdoor must have a unique tag from 1-9 in ascending order depending on how many you have (a good rule of thumb is five).  These first 1-9 sector tags must NOT be used elsewhere in the map.

## Script Control ##
To control opening Hackdoors you'll use the "HackDoom OpenHackdoor" script. It takes one variable:
* *Hackdoor*:  tag number of the Hackdoor to open.

__Usage Examples__
> pukename "HackDoom OpenHackdoor" 1

This opens the first Hackdoor tagged with sector tag 1.

> pukename "HackDoom OpenHackdoor" 9

This opens the ninth Hackdoor tagged with sector tag 9.
