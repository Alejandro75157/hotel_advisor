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
      comment_params = attributes_for(:comment)
      comment_params[:hotel] = @hotel
      comment_params[:user] = @user

      comment = Comment.new(comment_params)
      comment.build_rating
      comment.save

      visit "/hotels/#{@hotel.id}"
      expect{
          click_link '✕'
      }.to change(@hotel.comments,:count).by(-1)
    end
  end
end