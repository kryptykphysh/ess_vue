# frozen_string_literal: true
# == Schema Information
#
# Table name: statuses
#
#  id             :uuid             not null, primary key
#  name           :string
#  display_colour :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  text_colour    :integer          default("black"), not null
#
# Indexes
#
#  index_statuses_on_display_colour  (display_colour)
#  index_statuses_on_name            (name) UNIQUE
#

FactoryBot.define do
  factory :status do
    sequence(:name) { |n| "Test Status #{n}" }
    display_colour 1
  end
end
