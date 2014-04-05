require 'spec_helper'

RSpec.configure {|c| c.before { expect(controller).not_to be_nil }}

describe CommentsController do
  login_user

  it "should have a current_user" do
    # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
    subject.current_user.should_not be_nil
  end

  describe "POST create" do
    before :each do
      @hotel = create(:hotel)
    end

    context "with valid attributes" do

      it "creates a new comment" do
        expect{
          post :create, use_route: :hotels, comment: attributes_for(:comment, hotel: @hotel), hotel_id: @hotel.id
        }.to change(Comment,:count).by(1)
      end

      it "redirects to the hotel" do
        post :create, use_route: :hotels, comment: attributes_for(:comment, hotel: @hotel), hotel_id: @hotel.id
        response.should redirect_to @hotel
      end
    end

    context "with invalid attributes" do
      it "creates a new hotel" do
        expect{
          post :create, use_route: :hotels, comment: attributes_for(:comment, hotel: @hotel, body: nil), hotel_id: @hotel.id
        }.to_not change(Comment,:count)
      end
      it "re-renders the new method" do
        post :create, use_route: :hotels, comment: attributes_for(:comment, hotel: @hotel,  body: nil), hotel_id: @hotel.id
        response.should redirect_to @hotel
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @hotel = create(:hotel)
      @comment = create(:comment)
    end

    it "deletes the comment" do
      expect{
        delete :destroy, use_route: :hotels, id: @comment, hotel_id: @hotel.id
      }.to change(Comment,:count).by(-1)
    end

    it "redirects to hotel" do
      delete :destroy, use_route: :hotels, id: @comment, hotel_id: @hotel.id
      response.should redirect_to @hotel
    end
  end
end