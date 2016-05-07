App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message

  raisehacklift: (sector) ->
    @perform 'raisehacklift', message: sector

  lowerhacklift: (sector) ->
    @perform 'lowerhacklift', message: sector

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value =""
    event.preventDefault() 

$(document).on 'mousedown', '[data-behavior~=room_raiser]', (event) ->
  App.room.raisehacklift event.target.sectorid

$(document).on 'mousedown', '[data-behavior~=room_lower]', (event) ->
  App.room.lowerhacklift event.target.sectorid
