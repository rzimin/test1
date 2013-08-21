require 'spec_helper'

describe "pools/show" do
  before(:each) do
    @pool = assign(:pool, stub_model(Pool,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
