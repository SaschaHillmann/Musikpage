class AlbumsController < ApplicationController
before_filter :authorize, only: [:edit, :update, :new]
  def index
    @covers = Album.where("cover != 'NULL'", :order => "RANDOM()")
    @albums = Album.all(:order => "RANDOM()")
    @artists =Artist.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
      format.js
    end
  end

  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  def new
    @album = Album.new
    @artists = Artist.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])

      if @album.save
         redirect_to album_album_steps_path(@album)
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
    end
  end

  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end
