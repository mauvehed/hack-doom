# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
require 'open3'

class DoomChannel < ApplicationCable::Channel
  def initialize(*args)
    @outpipe, @inpipe = IO.pipe
    super(*args)
  end

  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def startserver
    command = "~/repos/hack-doom/certain/bin/certain.rb --iwad ~/.zandronum/doom2.wad --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --level hack01 --marines 2"
    servercheck = ""
    servercheck = `ps aux |grep "#{command}" | grep -v grep`

    # Do a check to make sure the server's not already running
    if servercheck == "" then
      i, o = Open3.popen2 "#{command}"

      # Begin command loop
      Thread.new do
        @outpipe.read.each do |line|
        #ARGF.each_line do |line|  #DEBUG
          puts line                #DEBUG
          i.puts line
        end

        i.close
      end

      while res = o.gets
        Message.create! content: res
      end
    else
      puts "Server already running."
    end
  end

  def relay(data)
    puts data                      #DEBUG
    @inpipe.write(data)
  end
end
