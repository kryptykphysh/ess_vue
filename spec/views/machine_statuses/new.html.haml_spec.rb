require 'rails_helper'

RSpec.describe "machine_statuses/new", type: :view do
  before(:each) do
    assign(:machine_status, MachineStatus.new(
      :machine => nil,
      :status => nil
    ))
  end

  it "renders new machine_status form" do
    render

    assert_select "form[action=?][method=?]", machine_statuses_path, "post" do

      assert_select "input[name=?]", "machine_status[machine_id]"

      assert_select "input[name=?]", "machine_status[status_id]"
    end
  end
end
