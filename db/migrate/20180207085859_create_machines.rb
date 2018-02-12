# frozen_string_literal: true

# Create table for Machine model
class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines, id: :uuid do |t|
      t.string :name, null: false
      t.string :location
      t.uuid :api_key, null: false, default: 'gen_random_uuid()'
      t.jsonb :config, null: false, default: '{}'

      t.timestamps
    end

    add_index :machines, :name
    add_index :machines, :api_key, unique: true
  end
end
