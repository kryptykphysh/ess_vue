class DashboardController < ApplicationController
  def index
    ActionCable.server.broadcast('message_channel', { fleep: 'flop' })
  end
end
