require 'rails_helper'

RSpec.describe "MachineStatuses", type: :request do
  describe "GET /machine_statuses" do
    it "works! (now write some real specs)" do
      get machine_statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
