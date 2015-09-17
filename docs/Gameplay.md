# Gameplay #
Hack Doom's objective is simple:  reach the exit switch in a level as fast as possible.  However to do so a team is going to need to work together and employ both gaming and hacking skills to succeed.

# Team Composition #
Teams are comprised of 2 - 8 players and broken into two components, __Control__ and __Marines__.

##Control##
Control is the hacker team component.  Its 1 - 4 players will be responsible for solving the challenges presented on the scoreboard.  Their challenges will not only provide points for their team but also allow Marines to proceed into new areas, provide PowerUp drops for Marines, as well as accidentally or on purpose spawn enemies for Marines.  However, new challenges must be unlocked by Marines so they will need to take an active interest in helping the Marines survive as well as finishing the challenges.

## Marines ##
Marines is the gamer team component.  Its 1 - 4 players will be responsible for advancing through the level and keeping the team moving forward.  Unlike Control they are given only one life each and if they all die their entire team will be eliminated!  Their actions in a level will not only provide points for their team but also allow Control to unlock new core challenges for Hackdoors, allow Control to unlock edge challenges for PowerUps, as well as allow the team to finish the level.  However, Hackdoors and PowerUps must be unlocked by Control so they will need to keep an active interest in searching for secret areas and switches as well as survival and mayhem.

# Components #
## Area ##
An Area is the section of a level revealed by a preceeding Hackdoor.  So in this case all things within the area beyond the first Hackdoor but before the second are part of Area 1, all the things beyond the second Hackdoor but before the third is Area 2, and so forth.

## Challenges ##
Challenges are what Control completes for points, PowerUps, and progression.  They take the form of CTF challenges hosted on the scoreboard and are broken down into two types.
### Core Challenges ###
Core challenges are unlocked by Marines via hitting the Hackswitch in each Area.  Completing a Core challenge for an Area immediately disables the others.  When Control completes one the following happens:
* the point value of the challenge is recorded.
* the completed Core challenge is disabled.
* the other Core challenges for the current Area are locked.
* Enemy Spawners in the current Area are disabled.
* Enemy Spawners in the next Area are enabled.
* the Hackdoor to the next Area opens.

### Edge Challenges ###
Edge challenges are unlocked by Marines finding the secret area in each Area.  Edge challenges may only be completed once, but all are available for choosing.  When Control completes one the following happens:
* Control chooses a PowerUp to drop in via the PowerUp Spawner for that Area.
* the chosen PowerUp is spawned via that Area's PowerUp Spawner.
* the completed Edge challenge is disabled.
* all non-completed Edge challenges are locked.
* the PowerUp Spawner for that Area is disabled.

## Hackdoor ##
Hackdoors are special doors that are only able to be opened by Control.  There is only one per Area and it is unlocked via Core challenges.

## Hackswitch ##
Hackswitches are special switches that are only able to be activated by Marines.  There is only one per Area and it unlocks the next Area's Core challenges.

## PowerUp ##
PowerUps are powerful items spawned by the server.  They are dropped into the game via one-time use PowerUp Spawners.  Available PowerUps include:
* Megahealth
* Invincibility
* Radiation Suit
* Backpack full of ammo
* Berserk
* Weapons
* Ammo

## Spawners ##
### Enemy Spawner ###
One of two types of spawner is the Enemy Spawner, a ZDoom MapSpot where enemies can be instantaneously created by the server.  Enemy Spawners in an Area will continually spawn until the next Hackdoor is unlocked.

### PowerUp Spawner ###
The second type of spawner is the PowerUp Spawner, a ZDoom MapSpot where PowerUps can be instantaneously created by the server.  There is only one per Area, is unlocked by the secret area within that Area, and can only be used once via Edge challenge.

# Secrets #
Secrets are secret areas used to unlock PowerUp Spawners and Edge challenges.  There is only one per Area and it unlocks locked Edge challenges as well as the Area's PowerUp Spawner.
