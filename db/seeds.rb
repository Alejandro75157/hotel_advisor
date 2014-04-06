require 'database_cleaner'

puts "=============Start database clean up============="
begin
  DatabaseCleaner.start
ensure
  DatabaseCleaner.clean
end
puts "=============Database clean============="


user_times = 5 + Random.rand(5)
files = Dir.glob(File.expand_path("../images/*.jpg", __FILE__))

user_times.times do
  user = User.create(email: Faker::Internet.email,
                     password: "12345678",
                     password_confirmation: "12345678",
                     username: Faker::Name.name)

  puts "User with email: #{user.email} was created"
  hotel_times = 5 + Random.rand(5)
  hotel_times.times do
    image_path = files[Random.rand(files.count)]
    hotel = Hotel.new(user: user,
                      title: Faker::Name.title,
                      image: Rack::Test::UploadedFile.new(image_path, "image/jpg"),
                      breakfast_included: true,
                      room_description: Faker::Lorem.paragraph(2),
                      price_for_room: Random.rand(100))

    address_times = 2 + Random.rand(3)
    address_times.times do
      address_params = {country: Faker::Address.country,
                        state: Faker::Address.state,
                        city: Faker::Address.city,
                        street: Faker::Address.street_address,
                        hotel: hotel}
      hotel.addresses.build(address_params)
    end
    hotel.save!
    puts "  Hotel with name: #{hotel.title} was created"

    comment_times = 2 + Random.rand(3)
    comment_times.times do
      comment = Comment.new(user: user,
                            hotel: hotel,
                            body: Faker::Lorem.sentence)
      comment.build_rating(score: Random.rand(5))
      comment.save!
      puts "    Comment: #{comment.body} was created"
    end
  end
end
