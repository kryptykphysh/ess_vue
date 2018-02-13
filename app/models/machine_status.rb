# frozen_string_literal: true

# == Schema Information
#
# Table name: machine_statuses
#
#  id              :uuid             not null, primary key
#  machine_id      :uuid             not null
#  status_id       :uuid             not null
#  first_logged_at :datetime         not null
#  last_logged_at  :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_machine_statuses_on_first_logged_at  (first_logged_at)
#  index_machine_statuses_on_last_logged_at   (last_logged_at)
#  index_machine_statuses_on_machine_id       (machine_id)
#  index_machine_statuses_on_status_id        (status_id)
#
# Foreign Keys
#
#  fk_rails_...  (machine_id => machines.id)
#  fk_rails_...  (status_id => statuses.id)

# Logs a single incident of a Status on a Machine until it changes
class MachineStatus < ApplicationRecord
  belongs_to :machine
  belongs_to :status

  validates :first_logged_at, presence: true
  validates :machine_id, presence: true
  validates :status_id, presence: true

  delegate :name, to: :status
end
