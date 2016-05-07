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

  def lowerhacklift(data)
    DoomChannel.lowerhacklift(data['sector'])
  end

  def raisehacklift(data)
    DoomChannel.raisehacklift(data['sector'])
  end
end
