# Hack Doom #
A blend of old-school shooter action and modern hacker CTF.

# Layout #
Inside this repo you'll find everything you need to get started with Hack Doom.  Directories are broken into the following structure:
* __docs:__ documentation on all aspects of Hack Doom.  This includes gameplay, server setup, mapping concerns, and more.
* __assets:__ all Doom assets created for Hack Doom.  This directory is the source for the *hackdoom.pk3* archive that's used to launch Hack Doom.
* __certain:__ contains the Zandronum wrapper Certain which allows control of a Zandronum game server.
* __gloom:__ contains the Rails-based web interface *Gloom* which Hack Doom uses to interact with Certain.
* __levels:__ submitted levels for Hack Doom.  These all have to follow the conventions in the documentation but are otherwise ready to play.

# Requirements #
* Doom WAD (preferably doom2.wad, but this will depend on the levels used)
* Rails 5.0+
* Ruby 2.0+
* [Zandronum] (https://zandronum.com/) 3.0+
