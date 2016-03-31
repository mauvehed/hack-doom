# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ConsoleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send(data)
    Message.create! content: data['message']
  end
end
