require 'spec_helper'

describe Address do
  it "should not save without 'country'"do
    build(:address, country: nil).should_not be_valid
  end

  it "should not save without 'state'"do
    build(:address, state: nil).should_not be_valid
  end

  it "should not save without 'city'"do
    build(:address, city: nil).should_not be_valid
  end

  it "should not save without 'street'"do
    build(:address, street: nil).should_not be_valid
  end
end