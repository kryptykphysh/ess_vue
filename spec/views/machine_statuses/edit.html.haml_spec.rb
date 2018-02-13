require 'rails_helper'

RSpec.describe "machine_statuses/edit", type: :view do
  before(:each) do
    @machine_status = assign(:machine_status, MachineStatus.create!(
      :machine => nil,
      :status => nil
    ))
  end

  it "renders the edit machine_status form" do
    render

    assert_select "form[action=?][method=?]", machine_status_path(@machine_status), "post" do

      assert_select "input[name=?]", "machine_status[machine_id]"

      assert_select "input[name=?]", "machine_status[status_id]"
    end
  end
end
