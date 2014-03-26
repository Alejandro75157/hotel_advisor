require 'spec_helper'

describe Hotel do
  it "should returns average ratings if has one" do
    paris_hotel = create(:paris_hotel)
    3.times do
      create(:comment, hotel: paris_hotel, user: paris_hotel.user, rating_attributes: attributes_for(:rating))
    end
    paris_hotel.average_rating.should be(3)
  end

  it "should not save without 'user'"
  it "should not save without 'room_description'"
  it "should not save without 'title'"

  it { expect {create(:hotel, addresses_attributes: [attributes_for(:address)])}.to change(Address, :count).by(1) }

  it { expect {create(:hotel, addresses_attributes: [attributes_for(:address), attributes_for(:address)])}.to change(Address, :count).by(2) }
end


