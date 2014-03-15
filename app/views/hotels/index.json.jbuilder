json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :title, :breakfast_included, :room_description, :photo, :price_for_room
  json.url hotel_url(hotel, format: :json)
end
