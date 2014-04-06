require 'spec_helper'

describe "Comments" do
  describe "Manage comments" do
    before { sign_in_as_a_user }


    it "Adds a new comment" do
      @hotel = create(:hotel)
      visit "/hotels/#{@hotel.id}"
      expect {
        within "#new_comment" do
          fill_in 'comment_body', with: "Body"
          click_button "Add comment"
        end
      }.to change(@hotel.comments, :count).by(1)
    end

    it "Adds a new invalid comment" do
      @hotel = create(:hotel)
      visit "/hotels/#{@hotel.id}"
      expect {
        within "#new_comment" do
          fill_in 'comment_body', with: nil
          click_button "Add comment"
        end
      }.to_not change(@hotel.comments, :count)
    end

    it "Deletes a comment" do
      @hotel = create(:hotel, user: @user)
      puts "Original is => hotel_id: #{@hotel.id} user_id: #{@user.id}"
      c_params = attributes_for(:comment)
      c_params[:hotel] = @hotel
      c_params[:user] = @user

      puts c_params
      c = Comment.new(c_params)
      c.build_rating
      c.save

      puts "Comment has => comment_id: #{c.id} hotel_id: #{c.hotel.id} user_id: #{c.user.id}"

      visit "/hotels/#{@hotel.id}"
      save_and_open_page
      expect{
          click_link '✕'
      }.to change(@hotel.comments,:count).by(-1)
    end
  end
end