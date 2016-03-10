# Hackswitches #
__Hackswitches__ are an important component of Hack Doom.  They guard Core Challenges and are unable to be activated by Control, only by Marines.  When Marines activate Hackswitches it unlocks Core Challenges, clearing the way for Control to complete them.  When a Hackswitch is activated though it ALSO begins spawning enemies from that Area's Enemy Spawners until the Core Challenge is completed!

# Level Editing #
Hackswitches rely on appropriate *action specials* attached to a switch in each Area.  The switch may be unique for every map but for Marines' sanity should all look identical and unique to everything else in the level.  Hackswitches are switches in all regards but do not need to be attached to anything else.  There should always be precisely __one__ Hackswitch __per Area__.  Without it the game cannot continue, though positioning of it is entirely up to the level designer.

To make a Hackswitch, simply create a switch texture on a wall, then assign it an action of either *Script Execute* or *ACS_Execute* depending on the map type.  For *Script Number* to execute, use __1__ and for *Argument 1* put in the __number__ of the __Area__ it is located in.  Naturally you will wish to set the trigger for this action to, "Player presses use."

# Script Control #
The script, script number *1* in *hackdoom.pk3*'s *hackdoom.o*, is very simple and requires one argument, the Area it is located in.  It is activated automatically after set up when a Marine presses the Hackswitch and presents a message onto the screen.  This will be interpreted by the server code to unlock that Area's Core Challenges.

__Usage Examples__
> Marines press use on Hackswitch in Area 1.

A message appears onscreen and in the server log of, "Area 1 Hackswitch activated!"

> Marines press use on Hackswitch in Area 5.

A message appears onscreen and in the server log of, "Area 5 Hackswitch activated!"
