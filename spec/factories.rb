FactoryGirl.define do
  factory :user, aliases: [:alejandro] do
    username { |n| "alejandro#{n}" }
    email { |n| "mail#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
  end


  factory :hotel, aliases: [:paris_hotel] do
    user
    title "Paris Hotel"
    breakfast_included true
    room_description "room_description"
    price_for_room 100
    image Rack::Test::UploadedFile.new(Rails.root + "spec/images/hotel.jpg", "image/jpg")
  end

  factory :comment do
    user
    hotel
    body { |n| "coment#{n}" }
  end

  factory :rating do
    user
    comment
    score 3
  end

  factory :address do
    hotel
    country {|n| "Country#{n}"}
    state {|n| "State#{n}"}
    city {|n| "City#{n}"}
    street {|n| "Street#{n}"}
  end
end

