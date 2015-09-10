# Level Editing #
To build levels for Hack Doom you're going to need a Doom level editor.  At the moment I recommend [Doom Builder](http://doombuilder.com).  Hack Doom levels make extensive use of Action Code Script ([ACS](http://www.zdoom.org/wiki/ACS)) and as a result the map options created MUST be set to "Doom in Hexen format." If you do not, you will not get the SCRIPTS lump in the resultant WAD file and scripts will not function.

When making a level due to the way scripting works you'll need to also create a __LOADACS__ lump as described in the __Assets__ documentation. 

## Tags ##
Tags are critical to the functioning of a Hack Doom level as they form the targets the scripting are going to drive.
* __Hackdoor Tags__: you'll need to assign each Hackdoor a sector ID tag (1-99 or up to two digits) and make a note of them for Hack Doom server configuration.
* __Spawner Tags__: each spawner in each area needs a tag.  This tag is formed as a four-digit number with the first two being the *Hackdoor Tag* (01-99) and the second two being a sequential enumeration of all spawners in the Hackdoor-accessible area (01-99).  This means the second spawner in the area revealed by the first Hackdoor is 0102.  The forty-fifth spawner in the area revealed by the fourth Hackdoor is 0445.
