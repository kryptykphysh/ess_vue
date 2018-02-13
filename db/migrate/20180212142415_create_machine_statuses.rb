# frozen_string_literal: true

# Create table for MachineStatus model
class CreateMachineStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_statuses, id: :uuid do |t|
      t.references :machine, type: :uuid, foreign_key: true, null: false
      t.references :status, type: :uuid, foreign_key: true, null: false
      t.datetime :first_logged_at, null: false
      t.datetime :last_logged_at

      t.timestamps
    end

    add_index :machine_statuses, :first_logged_at
    add_index :machine_statuses, :last_logged_at
  end
end
