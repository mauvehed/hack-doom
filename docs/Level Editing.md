# Level Editing #
To build levels for Hack Doom you're going to need a Doom level editor.  At the moment I recommend [Doom Builder](http://doombuilder.com).  Hack Doom levels make extensive use of Action Code Script ([ACS](http://www.zdoom.org/wiki/ACS)) and as a result the map options created MUST be set to "Doom in Hexen format." If you do not, you will not get the SCRIPTS lump in the resultant WAD file and scripts will not function.

When making a level due to the way scripting works you'll need to also create a __LOADACS__ lump as described in the __Assets__ documentation. 

## Tags ##
Tags are critical to the functioning of a Hack Doom level as they form the targets the scripting are going to drive.  The following are the reserved tags:
* __Hackdoor Tags__: you'll need to assign each Hackdoor a sector ID tag (1-9) and make a note of them for Hack Doom server configuration.
* __PowerUp Spawner Tags__: in each Hackdoor-accessible area there is __one__ friendly PowerUp spawner.  Its tag is formed as a two digit number with the first being the *Hackdoor Tag* (1-9) and the second being __0__.  This means that the PowerUp spawner in the first Area is *10*, the PowerUp spawner in the third Area is *30*.
* __Enemy Spawner Tags__: each enemy spawner in each area needs a tag.  This tag is formed as a two digit number with the first being the *Hackdoor Tag* (1-9) and the second being __1__.  This means all Enemy Spawners in Area 2 are tagged 21 and all Enemy Spawners in Area 4 are tagged 41.
