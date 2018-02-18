# frozen_string_literal: true

# Allow Messages to be handled via websockets
class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    ActionCable.server.broadcast 'message_channel', message: data['message']
  end
end
