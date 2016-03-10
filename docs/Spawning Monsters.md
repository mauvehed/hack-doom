# Spawning Monsters #
Spawning monsters and creating monster spawns is an integral part of Hack Doom.  They supply pressure on the Marines to continually move forward, find Secrets, and activate Hackswitches.

## Level Editing ##
Spawning monsters relies on having monster spawns in a map.  These are located under *Things -> Properties -> ZDoom -> Map Spot*.  In order to work with the spawnEnemy.acs code an appropriate tag number must be assigned.  The current convention is <*Tag of the Area, 1-9*>*1*.  You may place as many Enemy Spawners as you wish, but be warned that when spawning they will all spawn the chosen enemy type.

## Script Control ##
To control monster spawns you'll use the "HackDoom SpawnEnemy" script.  It takes a number of variables:
* *Spawner*:  tag number of this Area concatenated with 1.
* *MonstType*:  spawn number of the monster to spawn (list available on the [ZDoom Wiki](http://www.zdoom.org/wiki/Doom_spawn_numbers))
* *Fog*:  whether to set the NoFog value.  Zero by default to show fog on spawn, can be set to one to remove Fog. (optional)
* *MonstID*:  unique monster identifier, almost never needed.  Defaults to zero if not specified. (optional)

__Usage Examples__
> pukename "HackDoom SpawnEnemy" 11 2

This spawns a Chainguy at all Enemy Spawners in the first Area with teleport fog and MonsterID 0.

> pukename "HackDoom SpawnEnemy" 61 1 999

This spawns a Chainguy at all Enemy Spawners in the sixth Area with no teleport fog and MonsterID 999.
