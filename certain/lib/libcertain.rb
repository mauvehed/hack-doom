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
    gc = GameCommand.new
    ec = ExternalCommand.new
    
    # Begin command loop
    Thread.new do
      ARGF.each_line do |line|
        # Check if server requested to close
        if line =~ /quit/ then
          stop
          exit
        end
        i.puts ec.command(line)
      end
    
      i.close
    end

    while res = o.gets
      puts res
    end
  end

  def stop
    `ps aux | grep #{@doombin} | grep -v grep | awk '{print $2}' | xargs kill`
  end
end

# GameEvent is the base class that defines communication to and from a game in progress
class GameEvent
  def intialize
    # List of valid commands
    @commands = Hash.new
  end

  attr_reader :commands
end

# GameCommand is for events originating within a game
class GameCommand < GameEvent
  def initialize
    # List of valid commands
    @commands = { 'hackswitch' => 'Hackswitch',
                  'secret'     => 'Secret' }
  end

  # Translate the requested text into a command
  def command (request)
    tokens = request.split(/\s+/)
    raise ArgumentError, "Not a command" if tokens.empty?
    raise ArgumentError, "Unknown command" unless @commands.has_key? tokens[0]
  end
end

# ExternalCommand is for events originating outside the game
class ExternalCommand < GameEvent
  def initialize
    @commands = { 'openhackdoor'  => 'OpenHackdoor',
                  'spawnenemy'    => 'SpawnEnemy',
                  'spawnpowerup'  => 'SpawnPowerUp',
                  'lowerhacklift' => 'LowerHacklift',
                  'raisehacklift' => 'RaiseHacklift' }
  end

  # Translate the requested text into a command
  def command (request)
    tokens = request.split(/\s+/)
    raise ArgumentError, "Not a command" if tokens.empty?
    raise ArgumentError, "Unknown command" unless @commands.has_key? tokens[0]

    # Determine in-game command to run with arguments
    case tokens[0]
      when "openhackdoor"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 2

      when "spawnenemy"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 3
        if tokens[3] == nil then tokens[3] = 0 end
        if tokens[4] == nil then tokens[4] = 0 end

      when "spawnpowerup"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 3

      when "lowerhacklift"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 2
        if tokens[2] == nil then tokens[2] = 90 end

      when "raisehacklift"
        raise ArgumentError, 'Not enough arguments' unless tokens.size >= 2
        if tokens[2] == nil then tokens[2] = 90 end

      else
        raise ArgumentError, "Unknown command"
    end

    # Run the command
    transCommand = tokens.shift
    puts "pukename \"HackDoom #{@commands[transCommand]}\" #{tokens.join(" ")}"
  end
end
