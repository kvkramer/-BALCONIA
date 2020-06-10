# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Deleting old ones"
Review.delete_all
Message.delete_all
Chatroom.delete_all
Booking.delete_all
Sphere.delete_all
User.delete_all


puts "Creating some Spheres..."



user1 = User.create(name: 'Katha', email: "katha@icloud.com", password: "123456", image: "https://res.cloudinary.com/kathavk/image/upload/v1591628394/photography-of-a-guy-wearing-green-shirt-1222271_hmngp2.jpg")
user2 = User.create(name: 'Meallie', email: "inmeallie@gmail.com", password: "123456", image: "https://res.cloudinary.com/kathavk/image/upload/v1591628395/women-s-white-and-black-button-up-collared-shirt-774909_bvscpc.jpg")
user3 = User.create(name: 'Julia', email: "julia.schwenner@gmail.com", password: "123456", image: "https://res.cloudinary.com/kathavk/image/upload/v1591628395/women-s-white-and-black-button-up-collared-shirt-774909_bvscpc.jpg")


sphere = Sphere.create!(title: "cottage by the lake", address: "Wannsee, Berlin", cost_per_day: 21, user_id: user1.id, barbecue: true, balcony: false, garden: true, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: true)

file1 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591445953/mwrw2gx894bnq2hctfivfewndsvu.jpg')
sphere.photos.attach(io: file1, filename: 'spheres/1.png', content_type: 'image/png')
file2 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591372354/p883i86qv8wr82nylcj684de9phl.jpg')
sphere.photos.attach(io: file2, filename: 'spheres/2.png', content_type: 'image/png')
sphere.save

sphere = Sphere.create!(title: "cozy living room and balcony", address: "Prenzlauer Berg, Berlin", cost_per_day: 9, user_id: user2.id, barbecue: false, balcony: true, garden: false, terrace: true, plants: true, quiet: false, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: true)

file3 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591370486/xi2a69u5ct18t1fh78z3h6hft9gm.jpg')
sphere.photos.attach(io: file3, filename: 'spheres/3.png', content_type: 'image/png')
file4 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591370482/cseh2vc56cxsanvvm3txm0751a75.jpg')
sphere.photos.attach(io: file4, filename: 'spheres/4.png', content_type: 'image/png')
sphere.save

sphere = Sphere.create!(title: "old fashioned apartment with lovely kitchen", address: "Munich, Germany", cost_per_day: 15, user_id: user3.id, barbecue: false, balcony: true, garden: false, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: true)

file5 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591366606/vr5n5dmbc5fkz45qq3uw0wme92dt.jpg')
sphere.photos.attach(io: file5, filename: 'spheres/5.png', content_type: 'image/png')
file6 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591304306/ude2bl4ekomeozyoyri12qebi1zu.jpg')
sphere.photos.attach(io: file6, filename: 'spheres/6.png', content_type: 'image/png')
sphere.save



sphere4 = Sphere.create!(title: "greenhouse atelier for artists", address: "Engelbecken, Berlin", cost_per_day: 10, user_id: user1, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

sphere5 = Sphere.create!(title: "chill work spot in beer brewery in hip x-berg", address: "Oranienstrasse 37, Berlin", cost_per_day: 15, user_id: user2, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

sphere6 = Sphere.create!(title: "quiet spot next to private pond", address: "Bruno-Bauer-Strasse 15, Berlin", cost_per_day: 15, user_id: user1, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

sphere7 = Sphere.create!(title: "rooftop for offsite meetings for teams up to 12 ppl", address: "Greifswalderstrasse 212, Berlin", cost_per_day: 40, user_id: user2, barbecue: true, balcony: false, garden: true, terrace: true, plants: false, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: false)

sphere8 = Sphere.create!(title: "large terrace with highspeed wifi near Tempelhofer feld ", address: "Schillerpromenade 9, Berlin", cost_per_day: 15, user_id: user1, barbecue: false, balcony: false, garden: false, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: true, pet_friendly: true, cozy: false)

sphere9 = Sphere.create!(title: "house boat on the Spree", address: "Hauptstrasse 15, Berlin", cost_per_day: 30, user_id: user2, barbecue: false, balcony: false, garden: false, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

sphere10 = Sphere.create!(title: "home office with large desk and screen", address: "Am Friedrichshain 3, Berlin", cost_per_day: 9, user_id: user2, barbecue: false, balcony: true, garden: false, terrace: false, plants: false, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

puts "Finished!"
