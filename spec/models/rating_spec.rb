require 'spec_helper'

describe Rating do
  it "should not save without 'score'" do
    build(:rating, score: nil).should_not be_valid
  end

  it "should not save without 'comment'" do
    build(:rating, comment: nil).should_not be_valid
  end

  it {
    expect {
      create(:comment, rating_attributes: attributes_for(:rating, score: 1))
    }.to change(Rating, :count).by(1)
  }

  it "should have default score 0" do
    Rating.new.score.should be(0)
  end

  it 'should create rating with score 3' do
    comment = create(:comment, rating_attributes: attributes_for(:rating))
    comment.rating.score.should eq(3)
  end

  it 'should destroy rating if comment destroyed' do
    comment = create(:comment, rating_attributes: attributes_for(:rating))
    expect { comment.destroy }.to change(Rating, :count).by(-1)
  end
end