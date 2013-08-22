require 'spec_helper'

describe "options/index" do
  before(:each) do
    assign(:options, [
      stub_model(Option,
        :question_id => 1,
        :text => "MyText",
        :correct => false
      ),
      stub_model(Option,
        :question_id => 1,
        :text => "MyText",
        :correct => false
      )
    ])
  end

  it "renders a list of options" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
