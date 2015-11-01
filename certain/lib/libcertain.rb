require 'pty'
require 'open3'

# GameServer defines a running game server
class GameServer
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
    i, o = Open3.popen2 "#{command}"
    
    Thread.new do
      ARGF.each_line do |line|
        i.puts line if line.match(/pukename.*/)
      end
    
      i.close
    end

    while res = o.gets
      puts res
    end
  end

  def stop
    pid = `ps aux | grep #{@doombin}`
    `kill #{pid}`
  end
end

# GameEvent is the base class that defines communication to and from a game in progress
class GameEvent
  def intialize
    # List of valid commands
    @commands = []
  end

  def command(request)
  end

  attr_reader :commands
end

# GameCommand is for events originating within a game
class GameCommand < GameEvent
  def initialize
    super
  end
end

# ExternalCommand is for events originating outside the game
class ExternalCommand < GameEvent
  def initialize
    super
    @commands += [ 'OpenHackdoor',
                   'SpawnEnemy',
                   'SpawnPowerUp',
                   'LowerHacklift',
                   'RaiseHacklift' ]
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
