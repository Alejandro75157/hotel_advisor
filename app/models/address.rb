class Address < ActiveRecord::Base
  validates_presence_of :country, :state, :city,:street

  belongs_to :hotel
end
