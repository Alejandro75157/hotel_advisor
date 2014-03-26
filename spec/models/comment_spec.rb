require 'spec_helper'

describe Comment do
  before :all do
    @alejandro = build(:alejandro)
    @paris_hotel = build(:paris_hotel)
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


  it 'should create rating with score 5' do
    comment = create(:comment, rating_attributes: attributes_for(:rating))
    comment.rating.score.should eq(3)
  end

  it { expect {create(:comment, rating_attributes: attributes_for(:rating))}.to change(Rating, :count).by(1) }

  it { expect {create(:comment, rating_attributes: attributes_for(:rating, score: nil))}.to_not change(Rating, :count) }

  it { expect {create(:comment)}.to_not change(Rating, :count) }

end
