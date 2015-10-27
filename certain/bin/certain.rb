#!/usr/bin/env ruby
###########################################################
# Name:         Certain
# Date:         10/06/2015
# Author:       FOXX (frozenfoxx@github.com)
# Description:  Certain is a wrapper script for ZDoom that
#   is intended to be used with Hack Doom.
###########################################################
require_relative "../lib/libcertain.rb"
require "optparse"
require "open3"

$verbose = false
$stdout.sync = true

# Default argument values
options = {:websocketport => '5238', :wadfiles => [], :assets => ['hackdoom.pk3'], :iwad => "doom2.wad", :verbose => 'false'}

# Check number of arguments and for if the user requests help
parser = OptionParser.new do |o|
  o.banner = "Usage: #{$0} <options>"
  o.on("--websocketport PORT", "Port number to present via websocket") { |i| options[:websocketport] = i }
  o.on("--wadfiles A,B,C[...]", Array, "WAD files to run the server with") { |wads| options[:wadfiles] = wads }
  o.on("--assets D,E,F[...]", Array, "Asset files to load in Certain") { |files| options[:assets] = files }
  o.on("--iwad IWAD", "IWAD file (doom2.wad, doom.wad, etc") { |iwad| options[:iwad] = iwad }
  o.on("--marines NUM", "Number of Marines") { |i| options[:marines] = i }
  o.on( '-v', '--verbose', 'Output debugging information' ) { $verbose = true}
  o.on('-h') { puts o; exit }
end
parser.parse!

puts "Certain Doom launching..."

if $verbose == true then
  puts "Websocket port:  #{options[:websocketport]}"
  puts "IWAD:  #{options[:iwad]}"
  puts "WADs:\n"
    unless options[:wadfiles].empty? then options[:wadfiles].each { |i| puts " -#{i}" } end
  puts "Assets:\n"
    unless options[:assets].empty? then options[:assets].each { |i| puts " -#{i}" } end
  puts "Marines:  #{options[:marines]}"
  puts "Verbose?  #{$verbose}"
end

# Initialize GameServer object
gameServer = GameServer.new(options[:iwad], options[:assets], options[:wadfiles], options[:marines])

# Run the server
gameServer.async.start

loop do sleep 10 ; $stdout.puts "pukename \"HackDoom Welcome\"" end
