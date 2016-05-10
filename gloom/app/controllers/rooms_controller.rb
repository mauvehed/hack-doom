class RoomsController < ApplicationController
  def show
    @hackdoors = Hackdoor.all
    @hacklifts = Hacklift.all
    @messages = Message.all
  end
end
