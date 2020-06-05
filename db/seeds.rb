# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting old ones"
Booking.delete_all
Sphere.delete_all
User.delete_all

puts "Creating some Spheres..."


user = User.create(email: "katha@icloud.com", password: "123456")
user = User.create(email: "inmeallie@gmail.com", password: "123456")

Sphere.create!(title: "Cozy Living Room", address: "Berlin, Germany", cost_per_day: 10, user_id: user.id, barbecue: true, balcony: true, garden: false, terrace: true, plants: true, quiet: false, sunny: true, spacious_desk: false, highspeed_wifi: true, pet_friendly: false, cozy: true, photos: )
Sphere.create!(title: "City Garden in X-berg", address: "Kreuzberg, Germany", cost_per_day: 10, user_id: user.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: false, sunny: false, spacious_desk: false, highspeed_wifi: false, pet_friendly: false, cozy: false)
Sphere.create!(title: "Penthouse overlooking TV tower", address: "Prenzlauer Berg, Germany", cost_per_day: 10, user_id: user.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: false, sunny: false, spacious_desk: false, highspeed_wifi: false, pet_friendly: false, cozy: false)
Sphere.create!(title: "City Garden in London", address: "London, UK", cost_per_day: 10, user_id: user.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: false, sunny: false, spacious_desk: false, highspeed_wifi: false, pet_friendly: false, cozy: false)
Sphere.create!(title: "Warm fireplace", address: "Hamburg", cost_per_day: 15, user_id: user.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: false, sunny: false, spacious_desk: false, highspeed_wifi: false, pet_friendly: false, cozy: false)
Sphere.create!(title: "Fowery, quiet workplace", address: "Munich", cost_per_day: 9, user_id: user.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: false, sunny: false, spacious_desk: false, highspeed_wifi: false, pet_friendly: false, cozy: false)
Sphere.create!(title: "Quiet penthouse with terrace overlooking TV tower", address: "Prenzlauer Berg, Berlin", cost_per_day: 17, user_id: user.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: false, sunny: false, spacious_desk: false, highspeed_wifi: false, pet_friendly: false, cozy: false)
Sphere.create!(title: "Loft with large workplace for team up to 12", address: "Charlottenburg, Berlin", cost_per_day: 15, user_id: user.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: false, sunny: false, spacious_desk: false, highspeed_wifi: false, pet_friendly: false, cozy: true)

puts "Finished!"
