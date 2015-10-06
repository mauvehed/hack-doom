# GameServer defines a running game server
class GameServer
end

# GameEvent is the base class that defines communication to and from a game in progress
class GameEvent
end

# GameCommand is for events originating within a game
class GameCommand < GameEvent
end

# ExternalCommand is for events originating outside the game
class ExternalCommand < GameEvent
end
