# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Deleting old ones"
Booking.delete_all
Sphere.delete_all
User.delete_all

puts "Creating some Spheres..."


user1 = User.create(email: "katha@icloud.com", password: "123456", image: "https://res.cloudinary.com/kathavk/image/upload/v1591628394/photography-of-a-guy-wearing-green-shirt-1222271_hmngp2.jpg")
user2 = User.create(email: "inmeallie@gmail.com", password: "123456", image: "https://res.cloudinary.com/kathavk/image/upload/v1591628395/women-s-white-and-black-button-up-collared-shirt-774909_bvscpc.jpg")


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

sphere = Sphere.create!(title: "old fashioned apartment with lovely kitchen", address: "Munich, Germany", cost_per_day: 15, user_id: user1.id, barbecue: false, balcony: true, garden: false, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: true)
file5 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591366606/vr5n5dmbc5fkz45qq3uw0wme92dt.jpg')
sphere.photos.attach(io: file5, filename: 'spheres/5.png', content_type: 'image/png')
file6 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591304306/ude2bl4ekomeozyoyri12qebi1zu.jpg')
sphere.photos.attach(io: file6, filename: 'spheres/6.png', content_type: 'image/png')
sphere.save


puts "Finished!"
