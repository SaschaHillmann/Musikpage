class TracksController < ApplicationController
  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tracks }
    end
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @track = Track.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @track }
    end
  end

  # GET /tracks/new
  # GET /tracks/new.json
  def new
    @track = Track.new
    # # album = Album.find(params[:album_id])
    # # @track = album.track.create
    # # new_track_form = render_to_string :layout => false
    # # new_track_form.gsub!("[#{@track.id}]", "[#{Time.now.to_i}]")
    # # render :text => new_track_form, :layout => false
    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @track }
    # end
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(params[:track])
    @track.album = Album.find(params[:album_id])

    if @track.save
      respond_to do |format|
        format.html {redirect_to :back, notice: "Track eingefuegt." }
        format.js
      end
    end
  end

  # PUT /tracks/1
  # PUT /tracks/1.json
  def update
    @track = Track.find(params[:id])

    respond_to do |format|
      if @track.update_attributes(params[:track])
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    #album = Album.find(params[:album_id])
  #   unless album.track.exists?(params[:id])
  #     render :text => { :success => false, :msg => 'the track was not found.' }.to_json and return
  #   end
  #   if album.track.destroy(params[:id]) // Rails < 2.3.5, if album.track.destroy(Track.find(params[:id]))
  # render :text => { :success => true }.to_json
  #   else
  #     render :text => { :success => false, :msg => 'something unexpected happened.' }.to_json
  #   end
      respond_to do |format|
      format.html { redirect_to tracks_url }
      format.json { head :no_content }
    end
  end
end
