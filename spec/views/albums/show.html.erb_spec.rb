require 'spec_helper'

describe "albums/show" do
  before(:each) do
    @album = assign(:album, stub_model(Album,
      :id => 1,
      :name => "Name",
      :artist_id => 2,
      :genre_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
