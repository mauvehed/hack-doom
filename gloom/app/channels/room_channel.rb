# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message']
  end

  # Change the map
  def loadmap(data)
    CertainController.update("map #{data['message']}")
  end

  # Open an Area's Hackdoor
  def openhackdoor(data)
    CertainController.update("openhackdoor #{data['message']}")
  end

  ## Spawn enemies in an Area
  #def spawnenemy(area, enemy)
  #  CertainController.update("spawnenemy #{area}1 #{@enemytype[enemy]}")
  #end

  ## Spawn a powerup in an Area
  #def spawnpowerup(data)
  #  CertainController.update("spawnenemy #{data['area']}0 #{@poweruptype[data['item']]}")
  #end

  # Lower Hacklift
  def lowerhacklift(data)
    CertainController.update("lowerhacklift #{data['message']}")
  end

  # Raise Hacklift
  def raisehacklift(data)
    CertainController.update("raisehacklift #{data['message']}")
  end
end
