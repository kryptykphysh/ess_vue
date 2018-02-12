# frozen_string_literal: true

FactoryBot.define do
  factory :machine do
    name 'Test Machine'
    location 'There'
    config { { actions: %w[temperature vibration] } }
  end
end
