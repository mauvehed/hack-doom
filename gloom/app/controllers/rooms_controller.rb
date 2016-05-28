class RoomsController < ApplicationController
  def show
    @corechallenges = Challenge.where("area > 0")
    @edgechallenges = Challenge.where(area: '0')
    @hackdoors = Hackdoor.all
    @hacklifts = Hacklift.all
    @messages = Message.all
  end
end
