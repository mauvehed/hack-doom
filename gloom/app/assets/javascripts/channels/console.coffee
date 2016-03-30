App.console = App.cable.subscriptions.create "ConsoleChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    # Called when there's incoming data on the websocket for this channel

  send: (message) ->
    @perform 'send', message: message

$(document).on 'keypress', '[data-behavior~=console_sender]', (event) ->
  if event.keyCode is 13 # return = send
    App.console.send event.target.value
    event.target.value =""
    event.preventDefault()
