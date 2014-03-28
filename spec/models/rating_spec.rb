require 'spec_helper'

describe Rating do
  it "should not save without 'score'"do
    build(:rating, score: nil).should_not be_valid
  end

end