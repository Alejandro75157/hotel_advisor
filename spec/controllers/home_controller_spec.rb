require 'spec_helper'

describe HomeController do
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

    it "populates an array of hotels" do
      hotel = create(:hotel)
      comment = create(:comment, hotel: hotel, user: hotel.user)
      comment.rating = Rating.new score: 3, comment: comment
      comment.save
      get :index
      expect(assigns(:ordered_hotels)).to include(hotel)
    end
  end
end