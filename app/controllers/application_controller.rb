# frozen_string_literal: true

# Top level controller class
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
