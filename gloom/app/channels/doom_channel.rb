# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
require 'open3'

class DoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def startserver
    command = "~/repos/hack-doom/certain/bin/certain.rb --iwad ~/.zandronum/doom2.wad --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --level hack01 --marines 2"

    i, o = Open3.popen2 "#{command}"

    # Begin command loop
    Thread.new do
      #Message.all.each do |line|
      ARGF.each_line do |line|  #DEBUG
        i.puts line
      end

      i.close
    end

    while res = o.gets
      Message.create! content: res
      #puts res                  #DEBUG
    end
  end
end
