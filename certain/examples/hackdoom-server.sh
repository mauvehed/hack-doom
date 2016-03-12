#!/usr/bin/env bash
# All assume you are in the certain/bin directory

# Without websocket
#~/repos/hack-doom/certain/bin/certain-launcher.rb -n -v --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --iwad ~/.zandronum/doom2.wad --marines 2 --level hack01 --verbose

# With websocket
~/repos/hack-doom/certain/bin/certain-launcher.rb --websocketport 5283 --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --iwad ~/.zandronum/doom2.wad --marines 2 --level hack01 --verbose

# Direct Test
#./certain.rb --iwad ~/.zandronum/doom2.wad --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --level hack01 --marines 2

# bash websocket test
#websocketd --port 5283 ./certain.rb --iwad ~/.zandronum/doom2.wad --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --level hack01 --marines 2
