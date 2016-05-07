# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
require 'open3'

class DoomChannel < ApplicationCable::Channel
  def initialize(*args)
    # All enemy types supported for spawning
    @enemytype = {
      "shotguy"          => 1,
      "chainguy"         => 2,
      "baron"            => 3,
      "zombie"           => 4,
      "imp"              => 5,
      "arachnotron"      => 6,
      "spidermastermind" => 7,
      "demon"            => 8,
      "spectre"          => 9,
      "cacodemon"        => 19,
      "revenant"         => 20,
      "lostsoul"         => 110,
      "vile"             => 111,
      "mancubus"         => 112,
      "hellknight"       => 113,
      "cyberdemon"       => 114,
      "painelemental"    => 115,
      "wolfss"           => 116
    }

    # All powerup types supported for spawning
    @poweruptype = {
      "clip"             => 11,
      "shells"           => 12,
      "armorbonus"       => 22,
      "stimpack"         => 23,
      "medkit"           => 24,
      "soulsphere"       => 25,
      "shotgun"          => 27,
      "chaingun"         => 28,
      "rocketlauncher"   => 29,
      "plasmagun"        => 30,
      "bfg"              => 31,
      "chainsaw"         => 32,
      "supershotgun"     => 33,
      "greenarmor"       => 68,
      "bluearmor"        => 69,
      "cell"             => 75,
      "rocket"           => 127,
      "megasphere"       => 132,
      "invulnerability"  => 133,
      "berserk"          => 134,
      "invisibility"     => 135,
      "radsuit"          => 136,
      "computermap"      => 137,
      "lightamp"         => 138,
      "ammobox"          => 139,
      "rocketammo"       => 140,
      "rocketbox"        => 141,
      "battery"          => 142,
      "shellbox"         => 143,
      "backpack"         => 144,
      "healthbonus"      => 152
    }

    super(*args)
  end

  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def relay(data)
    #puts "Data in DoomChannel::relay:  #{data}"              #DEBUG

    # Process the input from room_channel
    datastring = Sanitize.clean(data['message'])
    datastring.gsub!("\n", "")
    datastring.gsub!(/^\s+/, "")
    #puts "StringData in DoomChannel::relay:  #{datastring}"  #DEBUG

    # Send the string over to DoomServerController
    CertainController.update(datastring)
  end

  # Change the map
  def loadmap(map)
    CertainController.update("map #{map}")
  end

  # Open an Area's Hackdoor
  def openhackdoor(area)
    CertainController.update("openhackdoor #{area}")
  end

  # Spawn enemies in an Area
  def spawnenemy(area, enemy)
    CertainController.update("spawnenemy #{area}1 #{@enemytype[enemy]}")
  end

  # Spawn a powerup in an Area
  def spawnpowerup(area, item)
    CertainController.update("spawnenemy #{area}0 #{@poweruptype[item]}")
  end

  # Lower a hacklift
  def lowerhacklift(lift)
    CertainController.update("lowerhacklift #{lift}")
  end

  # Raise a hacklift
  def raisehacklift(lift)
    CertainController.update("raisehacklift #{lift}")
  end
end
