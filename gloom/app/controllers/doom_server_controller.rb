require 'open3'

class DoomServerController < ApplicationController
  def index
    command = "~/repos/hack-doom/certain/bin/certain.rb --iwad ~/.zandronum/doom2.wad --wadfiles ~/repos/hack-doom/levels/hackdoom001/hackdoom001.wad --assets ~/repos/hack-doom/assets/hackdoom.pk3 --level hack01 --marines 2"
    servercheck = ""
    servercheck = `ps aux |grep "#{command}" | grep -v grep`

    # Do a check to make sure the server's not already running
    if servercheck == "" then
      @inpipe, @outpipe = Open3.popen2 "#{command}"

      # Store output from Certain
      while res = @outpipe.gets
        DoomLog.create! content: res
      end
    else
      puts "Server already running."
    end
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  # Send the string over to Certain
  def update(message)
    @inpipe.puts("#{message}")
  end

  def destroy
  end
end
