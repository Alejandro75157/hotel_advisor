class Comment < ActiveRecord::Base
  belongs_to :hotel
  belongs_to :user
  has_one :rating

  validates_presence_of :body, :user, :hotel
  accepts_nested_attributes_for :rating, reject_if: :all_blank
end
