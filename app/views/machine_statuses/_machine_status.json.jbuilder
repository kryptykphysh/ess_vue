json.extract! machine_status, :id, :machine_id, :status_id, :first_logged_at, :last_logged_at, :created_at, :updated_at
json.url machine_status_url(machine_status, format: :json)
