class ConsoleController < ApplicationController
  def show
    @messages = Message.all
  end
end
