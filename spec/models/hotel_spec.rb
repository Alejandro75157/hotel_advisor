require 'spec_helper'

describe Hotel do
  it "should returns average ratings if has one" do
    paris_hotel = create(:paris_hotel)
    3.times do
      create(:comment, hotel: paris_hotel, user: paris_hotel.user, rating_attributes: attributes_for(:rating))
    end
    paris_hotel.average_rating.should be(3)
  end

  it "should not save without 'user'"do
    build(:hotel, user: nil).should_not be_valid
  end

  it "should not save without 'room_description'"do
    build(:hotel, room_description: nil).should_not be_valid
  end
  it "should not save without 'title'"do
    build(:hotel, title: nil).should_not be_valid
  end

  it "should not save without 'image'"do
    build(:hotel, image: nil).should_not be_valid
  end

  it "should not save when image size more than 5 megabytes"do
    build(:hotel,
          image: Rack::Test::UploadedFile.new(Rails.root + "spec/images/heavy_hotel.jpg", "image/jpg")).should_not be_valid
  end

  it "should not save when image type not 'jpeg', 'jpg' or 'png'"do
    build(:hotel,
          image: Rack::Test::UploadedFile.new(Rails.root + "spec/images/foreign_format_hotel.gif", "image/gif")).should_not be_valid
  end
  it { expect {create(:hotel, addresses_attributes: [attributes_for(:address)])}.to change(Address, :count).by(1) }

  it { expect {create(:hotel, addresses_attributes: [attributes_for(:address), attributes_for(:address)])}.to change(Address, :count).by(2) }
end


