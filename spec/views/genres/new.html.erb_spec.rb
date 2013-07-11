require 'spec_helper'

describe "genres/new" do
  before(:each) do
    assign(:genre, stub_model(Genre,
      :id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new genre form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", genres_path, "post" do
      assert_select "input#genre_id[name=?]", "genre[id]"
      assert_select "input#genre_name[name=?]", "genre[name]"
    end
  end
end
