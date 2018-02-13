# frozen_string_literal: true

# Add text colour to Status model
class AddTextColourToStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :text_colour, :integer, null: false, default: 0
  end
end
