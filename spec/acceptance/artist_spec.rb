require 'acceptance/acceptance_helper'

feature 'Artist', %q{
  In order to create artists
  As a user
  I want create and manage artists
} do

  scenario 'Artist index' do
    Artist.create!(:name => 'Iggy Pop')
  	Artist.create!(:name => 'Boss Hoss')
  	visit artists_path
  	page.should have_content('Iggy Pop')
  	page.should have_content('Boss Hoss')	
  end

end