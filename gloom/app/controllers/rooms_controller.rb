class RoomsController < ApplicationController
  def show
    @challenges = Challenge.all
    @hackdoors = Hackdoor.all
    @hacklifts = Hacklift.all
    @messages = Message.all
  end
end
