# Hack Doom
A blend of old-school shooter action and modern hacker CTF.
# Levels
To build levels for Hack Doom you're going to need a Doom level editor.  At the moment I recommend [Doom Builder](http://doombuilder.com).  Hack Doom levels make extensive use of Action Code Script ([ACS](http://www.zdoom.org/wiki/ACS)) and as a result the map options created MUST be set to "Doom in Hexen format." If you do not, you will not get the SCRIPTS lump in the resultant WAD file and scripts will not function.

When making a level due to the way scripting works you'll need to take all the code for the scripts you wish to add to the core set and put it all into the SCRIPTS lump.  You'll also need to assign each script-controlled door a sector ID tag and make a note of them for scoreboard configuration.  You can find all the core scripts in the SCRIPTS subdirectory of this repository.
