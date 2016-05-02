class RoomsController < ApplicationController
  def show
    @hacklifts = Level.all.each {|x| x.hacklifts.split}
    @messages = Message.all
  end
end
