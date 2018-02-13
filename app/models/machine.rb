# == Schema Information
#
# Table name: machines
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  location   :string
#  api_key    :uuid             not null
#  config     :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_machines_on_api_key  (api_key) UNIQUE
#  index_machines_on_name     (name)

# Abstraction for a single test machine
class Machine < ApplicationRecord
  has_many :machine_statuses

  def last_logged_status
    Rails.cache.fetch("machine:last_logged_status:#{id}", expires_in: 6.hours) do
      ms = machine_statuses.includes(:status).order(first_logged_at: :desc).first
      if ms
        ms_hash = JSON.parse(ms.to_json)
        ms_hash[:status] = JSON.parse(ms.status.to_json)
      else
        ms_hash = {
          status: { name: 'None Logged', display_colour: 'default', text_colour: 'black' }
        }
      end
      ms_hash
    end
  end
end
