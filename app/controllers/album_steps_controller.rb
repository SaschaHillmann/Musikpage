class AlbumStepsController < ApplicationController
  include Wicked::Wizard

  steps  :add_genre, :name, :add_tracks, :cover


  def show
  	@album = Album.find(params[:album_id])
  	case step
  	when :add_genre
  		@artist = Artist.find(@album.artist_id)
  		@genres = Genre.all
  	when :add_tracks  		
  		@artist = Artist.find(@album.artist_id)
  		@genre = Genre.find(@album.genre_id)
   	else
  		@artist = Artist.find(@album.artist_id)
  		@genre = Genre.find(@album.genre_id)  	
	end
    render_wizard
  end

  def update
    @album = Album.find(params[:album_id])
    case step
    when :cover
    	require 'fileutils'  
    	tmp = params[:upload][:cover].tempfile
    	tmpname = params[:upload][:cover].original_filename
    	file = File.join("app/assets/images", params[:upload][:cover].original_filename)
    	FileUtils.cp tmp.path, file

    	@album.update_attributes(:cover => tmpname.to_s)    
    	redirect_to_finish_wizard
    else
    	@album.update_attributes(params[:album])	
    	render_wizard @album
    end   
  end

	def redirect_to_finish_wizard
		redirect_to root_url#, notice: "Thank you for create an album"		
	end

end
