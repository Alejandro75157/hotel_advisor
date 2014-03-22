json.array!(@addresses) do |address|
  json.extract! address, :id, :country, :state, :city, :street, :hotel_id
  json.url address_url(address, format: :json)
end
