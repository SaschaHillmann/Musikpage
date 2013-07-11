require 'spec_helper'

describe "tracks/show" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :id => 1,
      :name => "Name",
      :album_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/2/)
  end
end
