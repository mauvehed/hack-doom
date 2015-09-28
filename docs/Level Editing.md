# Level Editing #
To build levels for Hack Doom you're going to need a Doom level editor.  At the moment I recommend [Doom Builder](http://doombuilder.com).  Hack Doom levels make extensive use of Action Code Script ([ACS](http://www.zdoom.org/wiki/ACS)) and as a result the map options created MUST be set to either "ZDoom (Doom in UDMF)" or "ZDoom ()Doom in Hexen format)." If you do not, you will not get the SCRIPTS lump in the resultant WAD file and scripts will not function.

When making a level due to the way scripting works you'll need to also create a __LOADACS__ lump as described in the __Assets__ documentation. 

# Scripts #
While most of the scripts in Hack Doom rely on nothing more than appropriate sector, linedef, and thing tags there are unfortunately some functions that simply cannot work without using enumerated scripts.  The following are reserved scripts and how they fit into level editing.  Do NOT issue your scripts with these numbers or it will break your WAD!
* __1__:  Hackswitch activation script.  When placing a Hackswitch you must set the Action of the Linedef for the Hackswitch to "Script Execute." Supply the script number *1* and the Area number as the first and only argument.

# Tags #
Tags are critical to the functioning of a Hack Doom level as they form the targets the scripting are going to drive.  The following are the reserved tags:
* __Hackdoor Tags__: you'll need to assign each Hackdoor a sector ID tag (1-9) and make a note of them for Hack Doom server configuration.
* __PowerUp Spawner Tags__: in each Hackdoor-accessible area there is __one__ friendly PowerUp spawner.  Its tag is formed as a two digit number with the first being the *Hackdoor Tag* (1-9) and the second being __0__.  This means that the PowerUp spawner in the first Area is *10*, the PowerUp spawner in the third Area is *30*.
* __Enemy Spawner Tags__: each enemy spawner in each area needs a tag.  This tag is formed as a two digit number with the first being the *Hackdoor Tag* (1-9) and the second being __1__.  This means all Enemy Spawners in Area 2 are tagged *21* and all Enemy Spawners in Area 4 are tagged *41*.
* __Hacklift Tags__:  if you wish for your level to contain Hacklifts (and it's strongly recommended you have at least one or two) you will need to assign them a unique tag.  This may be whatever you wish, provided it's not a reserved tag, BUT you must list all of them in the *\<map name\>-properties.yml*
