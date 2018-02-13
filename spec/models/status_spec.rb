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

require 'rails_helper'

RSpec.describe Status, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
