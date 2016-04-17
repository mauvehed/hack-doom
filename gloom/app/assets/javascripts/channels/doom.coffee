App.doom = App.cable.subscriptions.create "DoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    #@perform 'startserver'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    @perform 'relay', message: data['message']
