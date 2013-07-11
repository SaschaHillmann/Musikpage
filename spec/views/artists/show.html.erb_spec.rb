require 'spec_helper'

describe "artists/show" do
  before(:each) do
    @artist = assign(:artist, stub_model(Artist,
      :id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
  end
end
