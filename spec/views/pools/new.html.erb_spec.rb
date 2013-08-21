require 'spec_helper'

describe "pools/new" do
  before(:each) do
    assign(:pool, stub_model(Pool,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new pool form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pools_path, "post" do
      assert_select "input#pool_name[name=?]", "pool[name]"
    end
  end
end
