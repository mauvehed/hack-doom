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

  # Translate the requested text into a command
  def command (request)
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
    @commands += [ 'openhackdoor',
                   'spawnenemy',
                   'spawnpowerup',
                   'lowerhacklift',
                   'raisehacklift' ]
  end

  # Translate the requested text into a command
  def command (request)
    tokens = request.split(/\s+/)

    # Check for valid command
    raise ArgumentError, "Not a command" unless tokens != nil
    raise ArgumentError, "Unknown command" unless @commands.include? tokens[0]

    # Determine in-game command to run with arguments
    case tokens[0]
      when "openhackdoor"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 2
        ExternalCommand.openhackdoor(tokens[1])

      when "spawnenemy"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 3
        if tokens[3] == nil then tokens[3] = 0 end
        if tokens[4] == nil then tokens[4] = 0 end
        ExternalCommand.spawnenemy(tokens[1], tokens[2], tokens[3], tokens[4])

      when "spawnpowerup"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 3
        ExternalCommand.spawnpowerup(tokens[1], tokens[2])

      when "lowerhacklift"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 2
        if tokens[2] == nil then tokens[2] = 90 end
        ExternalCommand.lowerhacklift(tokens[1], tokens[2])

      when "raisehacklift"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 2
        if tokens[2] == nil then tokens[2] = 90 end
        ExternalCommand.raisehacklift(tokens[1], tokens[2])

      else
        raise "Unknown command"
    end
  end

  # Opens the Hackdoor
  def openhackdoor (door)
    puts "pukename \"HackDoom OpenHackdoor\" #{door}"
  end

  # Spawns enemies
  def spawnenemy (spawner, type, fog = 0, monstid = 0)
    puts "pukename \"HackDoom SpawnEnemy\" #{spawner} #{type} #{fog} #{monstid}"
  end

  # Spawns PowerUps
  def spawnpowerup (spawner, type)
    puts "pukename \"HackDoom SpawnPowerUp\" #{spawner} #{type})"
  end

  # Lowers a Hacklift
  def lowerhacklift(lift, wait = 90)
    puts "pukename \"HackDoom LowerHacklift\" #{lift} #{wait}"
  end

  # Raises a Hacklift
  def raisehacklift(lift, wait = 90)
    puts "pukename \"HackDoom RaiseHacklift\" #{lift} #{wait}"
  end
end
