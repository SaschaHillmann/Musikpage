require 'spec_helper'

describe "albums/edit" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :id => 1,
      :name => "MyString",
      :artist_id => 1,
      :genre_id => 1
    ))
  end

  it "renders the edit album form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", album_path(@album), "post" do
      assert_select "input#album_id[name=?]", "album[id]"
      assert_select "input#album_name[name=?]", "album[name]"
      assert_select "input#album_artist_id[name=?]", "album[artist_id]"
      assert_select "input#album_genre_id[name=?]", "album[genre_id]"
    end
  end
end
