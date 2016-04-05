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
    servercheck = ""
    servercheck = `ps aux |grep "#{command}" | grep -v grep`

    # Do a check to make sure the server's not already running
    if servercheck == "" then
      @inpipe, @outpipe = Open3.popen2 "#{command}"

      # Store output from Certain
      while res = @outpipe.gets
        DoomLog.create! content: res
        puts res                                              #DEBUG
      end
    else
      puts "Server already running."
    end
  end

  def relay(data)
    #puts "Data in DoomChannel::relay:  #{data}"              #DEBUG

    # Process the input from room_channel
    datastring = Sanitize.clean(data['message'])
    datastring.gsub!("\n", "")
    datastring.gsub!(/^\s+/, "")
    #puts "StringData in DoomChannel::relay:  #{datastring}"  #DEBUG

    # Send the string over to Certain
    @inpipe.puts("#{datastring}")
  end
end
