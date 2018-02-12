# frozen_string_literal: true
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
#


FactoryBot.define do
  factory :machine do
    name 'Test Machine'
    location 'There'
    config { { actions: %w[temperature vibration] } }
  end
end
