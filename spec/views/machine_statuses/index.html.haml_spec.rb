require 'rails_helper'

RSpec.describe "machine_statuses/index", type: :view do
  before(:each) do
    assign(:machine_statuses, [
      MachineStatus.create!(
        :machine => nil,
        :status => nil
      ),
      MachineStatus.create!(
        :machine => nil,
        :status => nil
      )
    ])
  end

  it "renders a list of machine_statuses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
