# frozen_string_literal: true

# Top level model class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
