# Gameplay #
Hack Doom's objective is simple:  reach the final switch in a level as fast as possible.  However to do so a team is going to need to work together and employ both gaming and hacking skills to succeed.

# Team Composition #
Teams are comprised of 2 - 8 players and broken into two components, __Control__ and __Marines__.

## Control ##
Control is the hacker team component.  Its 1 - 4 players will be responsible for solving the challenges presented on the scoreboard.  Their challenges will not only provide points for their team but also allow Marines to proceed into new areas, provide PowerUp drops for Marines, as well as accidentally or on purpose spawn enemies for Marines.  However, new challenges must be unlocked by Marines so they will need to take an active interest in helping the Marines survive as well as finishing the challenges.

## Marines ##
Marines is the gamer team component.  Its 1 -4 players will be responsible for advancing through the level and keeping the team moving forward.  Unlike Control they are given only one life each and if they all die their entire team will be eliminated!  Their actions in a level will not only provide points for their team but also allow Control to unlock new core challenges for Hackdoors, allow Control to unlock edge challenges for PowerUps, as well as destroying enemies for points.  However, Hackdoors and PowerUps must be unlocked by Control so they will need to keep an active interest in searching for secret areas and switches as well as survival and mayhem.

# Components #
## Area ##
An Area is the section of a level revealed by a preceeding Hackdoor.  So in this case all things within the area beyond the first Hackdoor but before the second are part of Area 1, all the things beyond the second Hackdoor but before the third is Area 2, and so forth.

## Hackdoor ##  
Hackdoors are special doors that are only able to be opened by Control team.  There is only one per Area and it unlocks the next Area.

## PowerUp ##
PowerUps are one-time use item spawned by the server.  There is only one spawner per Area and each item may only be spawned once ever, regardless of Area.  The server will automatically pick to spawn it in the area most recently unlocked.

## Enemy Spawner ##
One of two types of spawner is the Enemy Spawner, a ZDoom MapSpot where enemies can be instantaneously created by the server.  Enemy Spawners in an Area will continually spawn until the next Hackdoor is unlocked.

## PowerUp Spawner ##
The second type of spawner is the PowerUp Spawner, a ZDoom MapSpot where PowerUps can be instantaneously created by the server.  There is only one per Area.
