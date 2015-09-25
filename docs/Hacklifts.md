# Hacklifts #
__Hacklifts__ are an interesting component Hack Doom.  They allow Control to take a more active role by allowing them to manipulate the level directly.  Hacklifts in all Areas are always available to be raised or lowered temporarily by Control and require no Challenges to unlock them.

# Level Editing #
Hacklifts rely only upon having a non-reserved (not 01-99) sector tag and nothing else. Hacklifts are lifts (raised or lowered) but should not respond to any player input (use, walk over, or otherwise interact with).  A level designer will also have to take note of these tags for the properties file supplied with the level so as to instruct the server as to where they are.  Optionally a level designer can specify a non-default period of time for the Hacklift to wait before resetting to its previous height and this can be done in the properties file.

# Tags #
Hacklifts __must__ be tagged with a non-reserved sector tag (01-99).

## Script Control ##
To control opening Hackdoors you'll use the "HackDoom RaiseHacklift" or "HackDoom LowerHacklift" scripts.  They take two variables:
* *Tag*:  tag number of the Hacklift to operate. (required)
* *Wait*:  the number of frames (30 = 1 second) to wait before resetting to the previous state.  If unspecified, it will default to 90 or 3 seconds.  __WARNING:__ if you set this to 0 the lift will *REMAIN* stuck in that position! (optional)

__Usage Examples__
> pukename "HackDoom RaiseHacklift" 100

This raises the Hacklift tagged *100* and waits for 3 seconds before resetting to its previous state.

> pukename "HackDoom LowerHacklift" 950 30

This lowers the Hacklift tagged *950* and waits for 1 second before resetting to its previous state.
