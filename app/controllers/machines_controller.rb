# frozen_string_literal: true

# Respond to requests for Machine resources
class MachinesController < ApplicationController
  def index
    @machines = Machine.all
  end
end
