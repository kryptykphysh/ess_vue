App.message = App.cable.subscriptions.create 'MessageChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log data

  send_message: (message) ->
    @perform 'send_message', message: message

$(document).on 'keypress', '[data-behavior~=message_send_message]', (event) ->
  if event.keyCode is 13 # return/enter = send
    app.message.send_message event.target.value
    event.target.value = ''
    event.preventDefault()
