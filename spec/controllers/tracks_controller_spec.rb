require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TracksController do

  # This should return the minimal set of attributes required to create a valid
  # Track. As you add validations to Track, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TracksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all tracks as @tracks" do
      track = Track.create! valid_attributes
      get :index, {}, valid_session
      assigns(:tracks).should eq([track])
    end
  end

  describe "GET show" do
    it "assigns the requested track as @track" do
      track = Track.create! valid_attributes
      get :show, {:id => track.to_param}, valid_session
      assigns(:track).should eq(track)
    end
  end

  describe "GET new" do
    it "assigns a new track as @track" do
      get :new, {}, valid_session
      assigns(:track).should be_a_new(Track)
    end
  end

  describe "GET edit" do
    it "assigns the requested track as @track" do
      track = Track.create! valid_attributes
      get :edit, {:id => track.to_param}, valid_session
      assigns(:track).should eq(track)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Track" do
        expect {
          post :create, {:track => valid_attributes}, valid_session
        }.to change(Track, :count).by(1)
      end

      it "assigns a newly created track as @track" do
        post :create, {:track => valid_attributes}, valid_session
        assigns(:track).should be_a(Track)
        assigns(:track).should be_persisted
      end

      it "redirects to the created track" do
        post :create, {:track => valid_attributes}, valid_session
        response.should redirect_to(Track.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved track as @track" do
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        post :create, {:track => { "id" => "invalid value" }}, valid_session
        assigns(:track).should be_a_new(Track)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        post :create, {:track => { "id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested track" do
        track = Track.create! valid_attributes
        # Assuming there are no other tracks in the database, this
        # specifies that the Track created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Track.any_instance.should_receive(:update_attributes).with({ "id" => "1" })
        put :update, {:id => track.to_param, :track => { "id" => "1" }}, valid_session
      end

      it "assigns the requested track as @track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :track => valid_attributes}, valid_session
        assigns(:track).should eq(track)
      end

      it "redirects to the track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :track => valid_attributes}, valid_session
        response.should redirect_to(track)
      end
    end

    describe "with invalid params" do
      it "assigns the track as @track" do
        track = Track.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        put :update, {:id => track.to_param, :track => { "id" => "invalid value" }}, valid_session
        assigns(:track).should eq(track)
      end

      it "re-renders the 'edit' template" do
        track = Track.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Track.any_instance.stub(:save).and_return(false)
        put :update, {:id => track.to_param, :track => { "id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested track" do
      track = Track.create! valid_attributes
      expect {
        delete :destroy, {:id => track.to_param}, valid_session
      }.to change(Track, :count).by(-1)
    end

    it "redirects to the tracks list" do
      track = Track.create! valid_attributes
      delete :destroy, {:id => track.to_param}, valid_session
      response.should redirect_to(tracks_url)
    end
  end

end
