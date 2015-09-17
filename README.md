# Hack Doom #
A blend of old-school shooter action and modern hacker CTF.

# Layout #
Inside this repo you'll find everything you need to get started with Hack Doom.  Directories are broken into the following structure:
* __docs:__ all documentation on all aspects of Hack Doom.  This includes gameplay, server setup, mapping concerns, and more.
* __assets:__ all Doom assets created for Hack Doom.  This directory is the source for the *hackdoom.pk3* archive that's used to launch Hack Doom.
* __levels:__ submitted levels for Hack Doom.  These all have to follow the conventions in the documentation but are otherwise ready to play.

# Terminology #
* __Hackdoor:__  a Hackdoor is a door only able to be opened by the hacker team via the Hack Doom server.
* __PowerUps:__  one-time use items spawned by the server.  There is only one spawner per area and each item may only be spawned once.  The server will automatically pick to spawn it in the area most recently unlocked.
* __Enemy Spawner:__ a ZDoom MapSpot where enemies can be instantaneously created by the server.  Enemy Spawners in an area will continually spawn until the next Hackdoor is unlocked.
* __PowerUp Spawner:__ a ZDoom MapSpot where PowerUps can be instantaneously created by the server.
