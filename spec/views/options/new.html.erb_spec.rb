require 'spec_helper'

describe "options/new" do
  before(:each) do
    assign(:option, stub_model(Option,
      :question_id => 1,
      :text => "MyText",
      :correct => false
    ).as_new_record)
  end

  it "renders new option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", options_path, "post" do
      assert_select "input#option_question_id[name=?]", "option[question_id]"
      assert_select "textarea#option_text[name=?]", "option[text]"
      assert_select "input#option_correct[name=?]", "option[correct]"
    end
  end
end
