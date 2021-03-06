# frozen_string_literal: true

# Add required extensions to database
class AddExtensions < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    enable_extension 'pgcrypto'
  end
end
