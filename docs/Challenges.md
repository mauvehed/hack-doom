# Challenges
__Challenges__ comprise the core of how the *Control* team will contribute to the game.  These are Jeapordy-style capture the flag challenges and are broken into two primary forms, *Core* and *Edge*.

## Requirements
* Challenges must be stored as individual directories under the `challenges` directory.
* Challenges must contain in their directory root an *info.yaml* file which contains the relevant information.  There are examples for this in this repository.
* a *content* directory must be supplied.  Whatever is to be presented as the Challenge must reside within this directory.

## Core Challenges
* __Description:__  *Core* challenges are worth points and are distributed by a certain amount per area chosen by the configurator of the server.
* __Trigger:__ *Area Hackswitch* activated by the *Marines*.  This will unlock all *Area* *Core* Challenges.
* __Database:__
  + __name:__  name of Challenge.
  + __area:__  *Area* associated with Challenge.
  + __flag:__  plaintext solution key.
  + __points:__  value of the Challenge.
  + __type:__  type of Challenge.
  + __hint:__  plaintext hint.
  + __locked:__ Boolean value of whether it is locked, default "true."
  + __solved:__ Boolean vlue of whether it has been solved, default "false."

## Edge Challenges
* __Description:__  *Edge* challenges are worth no points and have one per *Area* of the level.
* __Trigger:__  *Secret* found in an *Area*.  This will unloack all *Edge* Challenges.
* __Database:__
  + __name:__  name of Challenge.
  + __area:__  zero.
  + __flag:__  plaintext solution key.
  + __points:__  zero.
  + __type:__  type of Challenge.
  + __hint:__  plaintext hint.
  + __locked:__ Boolean value of whether it is locked, default "true."
  + __solved:__ Boolean vlue of whether it has been solved, default "false."
