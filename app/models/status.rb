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

# Records a possible Machine Status by name, with an associated display colour
class Status < ApplicationRecord
  has_many :machine_statuses

  enum display_colour: %i[default primary secondary success info warning danger light dark]
  enum text_colour: %i[black white]

  validates :display_colour, presence: true
  validates :name, presence: true, uniqueness: { case_insensitive: true }

  before_validation :set_defaults

  private

  def set_defaults
    self.text_colour ||= 'black'
    true
  end
end
