require 'spec_helper'

describe Comment do
  before :all do
    @alejandro = User.create(email: "gravidor@gmail.com", password: "12345678", password_confirmation: "12345678", username: "Tom")
    @paris_hotel = Hotel.create(user: @alejandro, title: "Paris Hotel", breakfast_included: true, room_description: "room_description", price_for_room: 100)
  end

  after :all do
    User.delete_all
    Hotel.delete_all
    Comment.delete_all
    Rating.delete_all
    Address.delete.all
  end

  it "should not be valid without Hotel" do
    Comment.new(user: @alejandro, hotel: nil, body: 'comment1').should_not be_valid
  end

  it "should not be valid without User" do
    Comment.new(user: nil, hotel: @paris_hotel, body: 'comment1').should_not be_valid
  end

  it "should not be valid without 'body'" do
    Comment.new(user: @alejandro, hotel: @paris_hotel, body: nil).should_not be_valid
  end

  it "should returns average ratings if has one" do
    comment = Comment.create(user: @alejandro, hotel: @paris_hotel, body: "comment1")
    rating1 = Rating.create(user: @alejandro, comment: comment, score: 2, default: 0)
    rating2 = Rating.create(user: @alejandro, comment: comment, score: 2, default: 0)
    rating2 = Rating.create(user: @alejandro, comment: comment, score: 5, default: 0)
    comment.average_rating.should be(3)
  end

  it "should not be valid without 'hotel'" do
    Address.new(country: 'USA', state: 'Dacota', city: 'New Dacota', stret: 'G.Washington st.', hotel: nil).should_not be_valid
  end

end
