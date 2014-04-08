require 'spec_helper'

describe HotelsController do
  login_user

  it "should have a current_user" do
    # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
    subject.current_user.should_not be_nil
  end

  describe "GET #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end


    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #user_index" do

    it "responds successfully with an HTTP 200 status code" do
      get :user_index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end


    it "renders the index template" do
      get :user_index
      expect(response).to render_template("user_index")
    end
  end

  describe "GET #show" do

    it "assigns the requested hotel to @hotel" do
      hotel = create(:hotel)
      get :show, id: hotel
      expect(assigns(:hotel)).to eq(hotel)
    end

    it "assigns the requested comment to @hotel.comment" do
      hotel = create(:hotel)
      comment = create(:comment, hotel: hotel, user: hotel.user)
      get :show, id: hotel
      expect(assigns(:hotel).comments.first).to eq(comment)
    end

    it "renders the show template" do
      get :show, id: create(:hotel, user: subject.current_user)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns the new hotel" do
      get :new
      expect(assigns(:hotel).addresses).not_to be_nil
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new hotel" do
        expect{
          post :create, hotel: attributes_for(:hotel)
        }.to change(Hotel,:count).by(1)
      end
      it "redirects to the new hotel" do
        post :create, hotel: attributes_for(:hotel)
        response.should redirect_to Hotel.last
      end
    end

    context "with invalid attributes" do
      it "creates a new hotel" do
        expect{
          post :create, hotel: attributes_for(:hotel, title: nil)
        }.to_not change(Hotel,:count)
      end
      it "re-renders the new method" do
        post :create, hotel: attributes_for(:hotel, title: nil)
        response.should render_template :new
      end
    end
  end

  describe 'PUT update' do
    before :each do
      @hotel = create(:hotel, title: "Lawrence Hotel")
    end

    context "valid attributes" do
      it "located the requested @hotel" do
        put :update, id: @hotel, hotel: attributes_for(:hotel)
        assigns(:hotel).should eq(@hotel)
      end

      it "changes @hotel's attributes" do
        put :update, id: @hotel,
            hotel: attributes_for(:hotel, title: "Larry Hotel", breakfast_included: false)
        @hotel.reload
        @hotel.title.should eq("Larry Hotel")
        @hotel.breakfast_included.should eq(false)
      end

      it "redirects to the updated hotel" do
        put :update, id: @hotel, hotel: attributes_for(:hotel)
        response.should redirect_to @hotel
      end
    end

    context "invalid attributes" do
      it "located the requested @hotel" do
        put :update, id: @hotel, hotel: attributes_for(:hotel, title: nil)
        assigns(:hotel).should eq(@hotel)
      end

      it "changes @hotel's attributes" do
        put :update, id: @hotel,
            hotel: attributes_for(:hotel, title: nil, breakfast_included: false)
        @hotel.reload
        @hotel.title.should_not eq("Larry Hotel")
        @hotel.breakfast_included.should_not eq(false)
      end

      it "redirects to the updated hotel" do
        put :update, id: @hotel, hotel: attributes_for(:hotel, title: nil)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @hotel = create(:hotel)
    end

    it "deletes the contact" do
      expect{
        delete :destroy, id: @hotel
      }.to change(Hotel,:count).by(-1)
    end

    it "redirects to hotels#index" do
      delete :destroy, id: @hotel
      response.should redirect_to hotels_url
    end
  end
end