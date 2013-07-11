require 'spec_helper'

describe "tracks/edit" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :id => 1,
      :name => "MyString",
      :album_id => 1
    ))
  end

  it "renders the edit track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", track_path(@track), "post" do
      assert_select "input#track_id[name=?]", "track[id]"
      assert_select "input#track_name[name=?]", "track[name]"
      assert_select "input#track_album_id[name=?]", "track[album_id]"
    end
  end
end
