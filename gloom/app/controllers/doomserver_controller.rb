require 'open3'
require 'pty'

class DoomserverController < ApplicationController
  def index
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
