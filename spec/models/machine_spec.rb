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

require 'rails_helper'

RSpec.describe Machine, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
