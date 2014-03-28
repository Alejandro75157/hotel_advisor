class Hotel < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :addresses

  has_attached_file :image, :styles => { :small => "150x150>" }

  validates_presence_of :user, :room_description, :title
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  accepts_nested_attributes_for :addresses, reject_if: :all_blank


  def average_rating
    scores = comments.map {|comment| comment.rating.score }
    scores.blank? ? 0 : (scores.sum() / comments.size)
  end
end
