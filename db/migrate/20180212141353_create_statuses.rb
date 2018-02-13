# frozen_string_literal: true

# Create table for Status model
class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses, id: :uuid do |t|
      t.string :name, presence: true
      t.integer :display_colour, presence: true

      t.timestamps
    end

    add_index :statuses, :name, unique: true
    add_index :statuses, :display_colour
  end
end
