# Spawning Monsters #
Spawning monsters and creating monster spawns is an integral part of Hack Doom.  After all, it's hard to create a challenge for the players without various enemies.

## Level Editing ##
Spawning monsters relies on having monster spawns in a map.  These are located under *Things -> Properties -> ZDoom -> Map Spot*.  In order to work with the spawnEnemy.acs code an appropriate tag number must be assigned.  The current convention is <*Tag of the Hackdoor for this area, 1-99*><*Two digit sequential enumeration, 01-99*>.  This leaves one hundred possible spawners per Hackdoor-accessible area which should be sufficient for plenty of challenge.

## Script Control ##
To control monster spawns you're going to want to include the *spawnEnemy.acs* code in your SCRIPTS lump.  It takes a number of variables:
* *Spawner*:  tag number of the Hackdoor for this area concatenated with the sequential MapSpot for the area.
* *MonstType*:  spawn number of the monster to spawn (list available on the [ZDoom Wiki](http://www.zdoom.org/wiki/Doom_spawn_numbers))
* *MonstID*:  normally not used, "999" is an acceptable choice by default.

__Usage Examples__
> puke 3 102 2 999

This spawns a Chainguy at the second MapSpot in the first Hackdoor area with a generic MonstID of 999.

> puke 3 5466 2 999

This spawns a Chainguy at the sixty-sixth MapSpot in the fifty-fourth Hackdoor area with a generic MonstID of 999.
