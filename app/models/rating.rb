class Rating < ActiveRecord::Base
  belongs_to :comment

  validates_presence_of :score, :comment
end
