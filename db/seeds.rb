# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
tom = User.create(email: "tom.koptel@gmail.com", password: "12345678", password_confirmation: "12345678", username: "Tom")
paris_hotel = Hotel.create(user: tom, title: "Paris Hotel", breakfast_included: true, room_description: "room_description", price_for_room: 100)
comment1 = Comment.create(user: tom, hotel: paris_hotel, body: 'comment1')
comment2 = Comment.create(user: tom, hotel: paris_hotel, body: 'comment2')
comment3 = Comment.create(user: tom, hotel: paris_hotel, body: 'comment3')
