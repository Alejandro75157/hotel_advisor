require 'spec_helper'

describe "Hotels" do

  describe "Manage hotels" do
    before { sign_in_as_a_user }

    it "Adds a new hotel and displays the results" do
      visit hotels_url
      expect {
        click_link 'New Hotel'
        within("#new_hotel") do
          fill_in 'Title', with: "John Hotel"
          check('Breakfast included')
          fill_in 'Room description', with: "Room description"
          attach_file('hotel_image', Rails.root + 'spec/images/hotel.jpg')
          fill_in 'Price for room', with: 100
          fill_in 'Country', with: "Countryt"
          fill_in 'State', with: "Statet"
          fill_in 'City', with: "Cityt"
          fill_in 'Street', with: "Streett"
          click_button "Create Hotel"
        end
      }.to change(Hotel, :count).by(1)
      page.should have_content "John Hotel"
      page.should have_content "$ 100"
      page.should have_content "Countryt"
      page.should have_content "Statet"
      page.should have_content "Cityt"
      page.should have_content "Streett"
    end


    it "try to add a invalid hotel" do
      visit hotels_url
      expect {
        click_link 'New Hotel'
        within("#new_hotel") do
          fill_in 'Title', with: nil
          check('Breakfast included')
          fill_in 'Room description', with: "Room description"
          attach_file('hotel_image', Rails.root + 'spec/images/hotel.jpg')
          fill_in 'Price for room', with: 100
          fill_in 'Country', with: "Countryt"
          fill_in 'State', with: "Statet"
          fill_in 'City', with: "Cityt"
          fill_in 'Street', with: "Streett"
          click_button "Create Hotel"
        end
      }.to_not change(Hotel, :count)
    end

    it "Update hotel and displays the results" do
      hotel = create(:hotel, title: 'Hotel', room_description: 'Room Description', user: @user)
      visit hotels_url
      expect {
        within ".hotel_item" do
          click_link 'Edit'
        end
        within(".edit_hotel") do
          fill_in 'Title', with: "John Hotel"
          click_button "Update Hotel"
        end
      }.to_not change(Hotel, :count)
      page.should have_content "John Hotel"
      page.should have_content "Room Description"
    end

    it "Update hotel to invalid and displays the results" do
      hotel = create(:hotel, title: 'Hotel', room_description: 'Room Description', user: @user)
      visit hotels_url
      expect {
        within ".hotel_item" do
          click_link 'Edit'
        end
        within(".edit_hotel") do
          fill_in 'Title', with: nil
          click_button "Update Hotel"
        end
      }.to_not change(Hotel, :count)
      page.should have_content "Title can't be blank"
    end


    it "Deletes a hotel" do
      hotel = create(:hotel, title: 'Hotel', room_description: 'Room Description', user: @user)
      visit hotels_path
      expect{
        within ".hotel_item" do
          click_link 'Destroy'
        end
      }.to change(Hotel,:count).by(-1)
      page.should have_content "New Hotel"
      page.should_not have_content "Hotel Room Description"
    end
  end
end