require 'spec_helper'

describe "albums/index" do
  before(:each) do
    assign(:albums, [
      stub_model(Album,
        :id => 1,
        :name => "Name",
        :artist_id => 2,
        :genre_id => 3
      ),
      stub_model(Album,
        :id => 1,
        :name => "Name",
        :artist_id => 2,
        :genre_id => 3
      )
    ])
  end

  it "renders a list of albums" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
