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

Sphere.create!(title: "Cozy Living Room", address: "Berlin", price: 10, user_id: user.id)
Sphere.create!(title: "City Garden in X-berg", address: "Kreuzberg, Germany", price: 10, user_id: user.id)
Sphere.create!(title: "Penthouse overlooking TV tower", address: "Prenzlauer Berg, Germany", price: 10, user_id: user.id)
Sphere.create!(title: "City Garden in London", address: "London, UK", price: 10, user_id: user.id)
Sphere.create!(title: "Warm fireplace", address: "Hamburg", price: 15, user_id: user.id)
Sphere.create!(title: "Fowery, quiet workplace", address: "Munich", price: 9, user_id: user.id)
Sphere.create!(title: "Quiet penthouse with terrace overlooking TV tower", address: "Prenzlauer Berg, Berlin", price: 17, user_id: user.id)
Sphere.create!(title: "Loft with large workplace for team up to 12", address: "Charlottenburg, Berlin", price: 15, user_id: user.id)

puts "Finished!"
