class HomeController < ApplicationController
  def index
    @ordered_hotels = Hotel.all.sort_by { |hotel| hotel.average_rating}.reverse.first(5)
  end
end