require 'spec_helper'

describe "tracks/index" do
  before(:each) do
    assign(:tracks, [
      stub_model(Track,
        :id => 1,
        :name => "Name",
        :album_id => 2
      ),
      stub_model(Track,
        :id => 1,
        :name => "Name",
        :album_id => 2
      )
    ])
  end

  it "renders a list of tracks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
