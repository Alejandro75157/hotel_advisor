class Comment < ActiveRecord::Base
  validates_presence_of :body

  belongs_to :hotel
  belongs_to :user
end
