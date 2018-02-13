json.extract! status, :id, :name, :display_colour, :text_colour, :created_at, :updated_at
json.url status_url(status, format: :json)
