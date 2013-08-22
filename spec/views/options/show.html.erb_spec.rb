require 'spec_helper'

describe "options/show" do
  before(:each) do
    @option = assign(:option, stub_model(Option,
      :question_id => 1,
      :text => "MyText",
      :correct => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
