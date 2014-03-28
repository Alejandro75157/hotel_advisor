require 'spec_helper'

describe User do
  it "should not save without 'username'"do
    build(:user, username: nil).should_not be_valid
  end

  it "should not save without 'email'"do
    build(:user, email: nil).should_not be_valid
  end

  it "should not save without 'password'"do
    build(:user, password: nil).should_not be_valid
  end

end