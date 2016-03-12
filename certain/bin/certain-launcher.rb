#!/usr/bin/env ruby
###########################################################
# Name:         certain-launcher
# Date:         10/06/2015
# Author:       FOXX (frozenfoxx@github.com)
# Description:  wraps the Certain program for websocket use.
###########################################################
require "optparse"

# Global variables
$verbose = false
$nowebsocket = false
$wsbin = `which websocketd`.strip!
$stdout.sync = true

# Default argument values
options = {:websocketport => '5238', :wadfiles => [], :assets => ['hackdoom.pk3'], :iwad => "doom2.wad", :level => "", :verbose => 'false'}

# Check number of arguments and for if the user requests help
parser = OptionParser.new do |o|
  o.banner = "Usage: #{$0} <options>"
  o.on("--websocketport PORT", "Port number to present via websocket") { |i| options[:websocketport] = i }
  o.on("--wadfiles A,B,C[...]", Array, "WAD files to run the server with") { |wads| options[:wadfiles] = wads }
  o.on("--assets D,E,F[...]", Array, "Asset files to load in Certain") { |files| options[:assets] = files }
  o.on("--iwad IWAD", "IWAD file (doom2.wad, doom.wad, etc)") { |iwad| options[:iwad] = iwad }
  o.on("--marines NUM", "Number of Marines") { |i| options[:marines] = i }
  o.on("--level LEVEL", "Level to load") { |level| options[:level] = level }
  o.on( '-v', '--verbose', 'Output debugging information' ) { $verbose = true}
  o.on( '-n', '--nowebsocket', 'Do not start with websocketd.' ) { $nowebsocket = true}
  o.on('-h') { puts o; exit }
end
parser.parse!

if $verbose == true then
  puts "Websocket port:  #{options[:websocketport]}"
  puts "IWAD:  #{options[:iwad]}"
  puts "WADs:\n"
    unless options[:wadfiles].empty? then options[:wadfiles].each { |i| puts " -#{i}" } end
  puts "Assets:\n"
    unless options[:assets].empty? then options[:assets].each { |i| puts " -#{i}" } end
  puts "Marines:  #{options[:marines]}"
  puts "Level:  #{options[:level]}"
  puts "Websocket?  #{$nowebocket}"
  puts "Verbose?  #{$verbose}"
end

if !$nowebsocket then
  system("#{$wsbin} --port #{options[:websocketport]} ./certain.rb --iwad #{options[:iwad]} --assets #{options[:assets].join(' ')} --wadfiles #{options[:wadfiles].join(' ')} --marines #{options[:marines]} --level #{options[:level]}")
else
  system("./certain.rb --iwad #{options[:iwad]} --assets #{options[:assets].join(' ')} --wadfiles #{options[:wadfiles].join(' ')} --marines #{options[:marines]} --level #{options[:level]}")
end
