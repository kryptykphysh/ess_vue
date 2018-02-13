json.extract! machine, :id, :name, :location, :config, :created_at, :updated_at
json.last_logged_status machine.last_logged_status
json.url machine_url(machine, format: :json)
