require 'spec_helper'

describe "pools/index" do
  before(:each) do
    assign(:pools, [
      stub_model(Pool,
        :name => "Name"
      ),
      stub_model(Pool,
        :name => "Name"
      )
    ])
  end

  it "renders a list of pools" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
