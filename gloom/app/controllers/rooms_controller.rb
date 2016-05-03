class RoomsController < ApplicationController
  def show
    @hacklifts = Hacklift.all
    @messages = Message.all
  end
end
