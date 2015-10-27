require 'pty'
require 'celluloid/current'
require 'open3'

# GameServer defines a running game server
class GameServer
  include Celluloid

  def initialize(iwad, assets, wads, marines)
    @doombin = `which zandronum`.strip!
    @args = "-iwad #{iwad} -host #{marines} -coop -file #{assets.join(' ')} #{wads.join(' ')}"
    @extCmd = ExternalCommand.new
    @gamCmd = GameCommand.new
  end

  def where?
    @doombin
  end

  def start
    command = "#{@doombin} #{@args}"
    if $verbose then puts "Launching with command:  \"#{command}\"" end
    Open3.pipeline("#{command}")
  end

  def stop
    pid = `ps aux | grep #{@doombin}`
    `kill #{pid}`
  end
end

# GameEvent is the base class that defines communication to and from a game in progress
class GameEvent
  def intialize
  end
end

# GameCommand is for events originating within a game
class GameCommand < GameEvent
  def initialize
  end
end

# ExternalCommand is for events originating outside the game
class ExternalCommand < GameEvent
  def initialize
  end

  # Opens the Hackdoor
  def openHackdoor (door)
    puts "pukename \"HackDoom OpenHackdoor\" #{door}"
  end

  # Spawns enemies
  def spawnEnemy (spawner, type, fog = 0, monstid = 0)
    puts "pukename \"HackDoom SpawnEnemy\" #{spawner} #{type} #{fog} #{monstid}"
  end

  # Spawns PowerUps
  def spawnPowerUp (spawner, type)
    puts "pukename \"HackDoom SpawnPowerUp\" #{spawner} #{type})"
  end

  # Lowers a Hacklift
  def lowerHacklift(lift, wait = 90)
    puts "pukename \"HackDoom LowerHacklift\" #{lift} #{wait}"
  end

  # Raises a Hacklift
  def raiseHacklift(lift, wait = 90)
    puts "pukename \"HackDoom RaiseHacklift\" #{lift} #{wait}"
  end
end
