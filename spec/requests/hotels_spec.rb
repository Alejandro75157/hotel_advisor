require 'spec_helper'

describe "Hotels" do

  describe "Manage hotels" do
    before { sign_in_as_a_valid_user }

    it "Adds a new hotel and displays the results" do
      visit hotels_url
      expect{
        click_link 'New Hotel'
        fill_in 'Title', with: "John Hotel"
        check('Breakfast included')
        fill_in 'Room description', with: "Room description"
        attach_file('Image',Rails.root + 'spec/images/hotel.jpg')
        fill_in 'Price for room', with: 100
        fill_in 'Country', with: "Country"
        fill_in 'State', with: "State"
        fill_in 'City', with: "City"
        fill_in 'Street', with: "Street"
        click_button "Create Hotel"
      }.to change(Hotel,:count).by(1)
    end
  end
end