require 'spec_helper'

describe "artists/edit" do
  before(:each) do
    @artist = assign(:artist, stub_model(Artist,
      :id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit artist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", artist_path(@artist), "post" do
      assert_select "input#artist_id[name=?]", "artist[id]"
      assert_select "input#artist_name[name=?]", "artist[name]"
    end
  end
end
