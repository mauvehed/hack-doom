class DoomLogBroadcastJob < ApplicationJob
  queue_as :default

  def perform(logmessage)
    ActionCable.server.broadcast 'doom_channel', doomlog: render_logmessage(logmessage)
  end

  private
    def render_logmessage(logmessage)
      ApplicationController.renderer.render(partial: 'doomlogs/doomlog', locals: { doomlog: logmessage })
    end
end
