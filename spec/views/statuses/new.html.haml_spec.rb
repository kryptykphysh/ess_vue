require 'rails_helper'

RSpec.describe "statuses/new", type: :view do
  before(:each) do
    assign(:status, Status.new(
      :name => "MyString",
      :display_colour => 1
    ))
  end

  it "renders new status form" do
    render

    assert_select "form[action=?][method=?]", statuses_path, "post" do

      assert_select "input[name=?]", "status[name]"

      assert_select "input[name=?]", "status[display_colour]"
    end
  end
end
