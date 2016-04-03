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
    servercheck = ""
    servercheck = `ps aux |grep \"#{command}\" | grep -v grep`

    command = "~/repos/hack-doom/certain/bin/certain.rb --iwad ~/.zandronum/doom2.wad --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --level hack01 --marines 2"

    # Do a check to make sure the server's not already running
    if servercheck == "" then
      @outpipe, @inpipe = IO.pipe
      i, o = Open3.popen2 "#{command}"

      # Begin command loop
      Thread.new do
        @outpipe.read.each_line do |line|
        #ARGF.each_line do |line|  #DEBUG
          i.puts line
          puts line                #DEBUG
        end

        i.close
      end

      while res = o.gets
        Message.create! content: res
        #puts res                  #DEBUG
      end
    else
      puts "Server already running."
    end
  end

  def relay(data)
    @inpipe.write(data)
    puts data                      #DEBUG
  end
end
