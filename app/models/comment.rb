class Comment < ActiveRecord::Base
  validates_presence_of :body, :user, :hotel

  belongs_to :hotel
  belongs_to :user
  has_many :ratings

  def average_rating
    ratings.sum(:score) / ratings.size
  end
end
