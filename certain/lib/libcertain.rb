# GameServer defines a running game server
class GameServer
  def initialize(iwad, assets, wads)
    @zdoom = `which zdoom`.strip!
    @args = "-iwad #{iwad} -file #{assets.gsub(/,/, ' ')} #{wads.gsub(/,/, ' ')}"
  end

  def where?
    @zdoom
  end

  def start
    `#{@zdoom} #{@args}`
  end

  def stop
    pid = `ps aux | grep #{@zdoom}`
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

  def openHackdoor (door)
    puts "pukename HackDoom OpenHackdoor #{door}"
  end
end
