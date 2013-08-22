require 'spec_helper'

describe "options/edit" do
  before(:each) do
    @option = assign(:option, stub_model(Option,
      :question_id => 1,
      :text => "MyText",
      :correct => false
    ))
  end

  it "renders the edit option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", option_path(@option), "post" do
      assert_select "input#option_question_id[name=?]", "option[question_id]"
      assert_select "textarea#option_text[name=?]", "option[text]"
      assert_select "input#option_correct[name=?]", "option[correct]"
    end
  end
end
