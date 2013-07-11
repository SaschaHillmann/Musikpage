require 'acceptance/acceptance_helper'

feature 'Album', %q{
  In order to create albums
  As a user
  I want create and manage albums
} do


	scenario 'Album should belongs to genre' do
	  genre = Genre.create!(:name => 'Metal')
	  album = Album.new
	  album.name = 'Big Ones'	  
	  album.genre = genre
	  album.save!
	  album.genre.name.should == 'Metal'
	end
	scenario 'Album should belongs to Artist' do
	  artist = Artist.create!(:name => 'Boss Hoss')
	  album = Album.new
	  album.name = 'liberty of '	  
	  album.artist = artist
	  album.save!
	  album.artist.name.should == 'Boss Hoss'
	end
end
