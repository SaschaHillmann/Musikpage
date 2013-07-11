class GenresController < ApplicationController
before_filter :authorize
  def index
    @genres = Genre.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genres }
    end
  end

  def show
    @genre = Genre.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @genre }
    end
  end

  def new
    @genre = Genre.new
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @genre }
    # end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(params[:genre])
    @album = Album.last
    respond_to do |format|
      if @genre.save
        @album.update_attributes(:genre_id => @genre.id)
        format.html { redirect_to album_album_steps_path(:id => "name", :album_id => @album.id), notice: 'Genre was successfully created.' }
        #redirect_to :back
        format.js #on { render json: @genre, status: :created, location: @genre }
      # else
      #   format.html { render action: "new" }
      #   format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /genres/1
  # PUT /genres/1.json
  def update
    @genre = Genre.find(params[:id])

    respond_to do |format|
      if @genre.update_attributes(params[:genre])
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to genres_url }
      format.json { head :no_content }
    end
  end
end
