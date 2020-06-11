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

#message1 = Message.create(content: "Hi, is your place pet friendly?", user_id: user1.id, sphere_id: sphere14.id, chatroom_id: chatroom1.id)
#chatroom1 = Chatroom.create(name: "", sphere_id: sphere.id)

sphere1 = Sphere.create!(title: "cottage by the lake", address: "Wannsee, Berlin", cost_per_day: 21, user_id: user1.id, barbecue: true, balcony: false, garden: true, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: true)

file1 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591445953/mwrw2gx894bnq2hctfivfewndsvu.jpg')
sphere1.photos.attach(io: file1, filename: 'spheres/1.png', content_type: 'image/png')
file2 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591372354/p883i86qv8wr82nylcj684de9phl.jpg')
sphere1.photos.attach(io: file2, filename: 'spheres/2.png', content_type: 'image/png')
sphere1.save

sphere2 = Sphere.create!(title: "cozy living room and balcony", address: "Prenzlauer Berg, Berlin", cost_per_day: 9, user_id: user2.id, barbecue: false, balcony: true, garden: false, terrace: true, plants: true, quiet: false, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: true)

file3 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591370486/xi2a69u5ct18t1fh78z3h6hft9gm.jpg')
sphere2.photos.attach(io: file3, filename: 'spheres/3.png', content_type: 'image/png')
file4 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591370482/cseh2vc56cxsanvvm3txm0751a75.jpg')
sphere2.photos.attach(io: file4, filename: 'spheres/4.png', content_type: 'image/png')
sphere2.save

sphere3 = Sphere.create!(title: "old fashioned apartment with lovely kitchen", address: "Munich, Germany", cost_per_day: 15, user_id: user3.id, barbecue: false, balcony: true, garden: false, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: true)

file5 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591366606/vr5n5dmbc5fkz45qq3uw0wme92dt.jpg')
sphere3.photos.attach(io: file5, filename: 'spheres/5.png', content_type: 'image/png')
file6 = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591304306/ude2bl4ekomeozyoyri12qebi1zu.jpg')
sphere3.photos.attach(io: file6, filename: 'spheres/6.png', content_type: 'image/png')
sphere3.save

# sphere4 = Sphere.create!(title: "greenhouse atelier for artists", address: "Engelbecken, Berlin", cost_per_day: 10, user_id: user1.id, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

# sphere5 = Sphere.create!(title: "chill work spot in beer brewery in hip x-berg", address: "Oranienstrasse 37, Berlin", cost_per_day: 15, user_id: user2.id, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)



# sphere6 = Sphere.create!(title: "quiet spot next to private pond", address: "Bruno-Bauer-Strasse 15, Berlin", cost_per_day: 15, user_id: user1.id, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

# sphere7 = Sphere.create!(title: "rooftop for offsite meetings for teams up to 12 ppl", address: "Greifswalderstrasse 212, Berlin", cost_per_day: 40, user_id: user2.id, barbecue: true, balcony: false, garden: true, terrace: true, plants: false, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: false)

# sphere8 = Sphere.create!(title: "large terrace with highspeed wifi near Tempelhofer feld ", address: "Schillerpromenade 9, Berlin", cost_per_day: 15, user_id: user1.id, barbecue: false, balcony: false, garden: false, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: true, pet_friendly: true, cozy: false)

# sphere9 = Sphere.create!(title: "house boat on the Spree", address: "Hauptstrasse 15, Berlin", cost_per_day: 30, user_id: user2.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

# sphere10 = Sphere.create!(title: "home office with large desk and screen", address: "Am Friedrichshain 3, Berlin", cost_per_day: 9, user_id: user2.id, barbecue: false, balcony: true, garden: false, terrace: false, plants: false, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)


sphere11 = Sphere.create!(title: "House boat on the Spree", address: "Hauptstr. 15, 10137 Berlin", description: "Enjoy a relaxing day on Berlin's waters for a day!", cost_per_day: 35, user_id: user3.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: false, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: true)
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865993/atte-gronlund-JiphyElpixM-unsplash_w7rblk.jpg')
sphere11.photos.attach(io: file, filename: 'spheres/111.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/evren-aydin-k_-rJeU2XTw-unsplash_srglvw.jpg')
sphere11.photos.attach(io: file, filename: 'spheres/112.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/kanan-khasmammadov-RIsKOU4cAd4-unsplash_sekqel.jpg')
sphere11.photos.attach(io: file, filename: 'spheres/113.png', content_type: 'image/png')

sphere12 = Sphere.create!(title: "Plant lover's paradise", address: "Oderstr. 1, Berlin", description: "Indulge in a green miracle garden in the heart of Neukölln!", cost_per_day: 25, user_id: user3.id, barbecue: true, balcony: false, garden: true, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: true)
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591866297/bruno-martins-Kxv2JHh2fQ8-unsplash_sa2mww.jpg')
sphere12.photos.attach(io: file, filename: 'spheres/121.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591866297/arno-smit-iI72r3gSwWY-unsplash_dpca7t.jpg')
sphere12.photos.attach(io: file, filename: 'spheres/122.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591866297/veronica-reverse-qYwyRF9u-uo-unsplash_koenmi.jpg')
sphere12.photos.attach(io: file, filename: 'spheres/123.png', content_type: 'image/png')

sphere13 = Sphere.create!(title: "Cozy spacious loft!", address: "Emser Str. 116, Berlin", description: "Spend an alternative working day at our amazing loft!", cost_per_day: 45, user_id: user3.id, barbecue: false, balcony: true, garden: false, terrace: false, plants: false, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: false)
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865993/atte-gronlund-JiphyElpixM-unsplash_w7rblk.jpg')
# sphere13.photos.attach(io: file, filename: 'spheres/131.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/evren-aydin-k_-rJeU2XTw-unsplash_srglvw.jpg')
# sphere13.photos.attach(io: file, filename: 'spheres/132.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/kanan-khasmammadov-RIsKOU4cAd4-unsplash_sekqel.jpg')
# sphere13.photos.attach(io: file, filename: 'spheres/133.png', content_type: 'image/png')

sphere14 = Sphere.create!(title: "Green haven", address: "Weisestr. 49, 12049 Berlin", description: "Relax in our beautiful flower filled garden !", cost_per_day: 20, user_id: user3.id, barbecue: true, balcony: false, garden: true, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: true, pet_friendly: true, cozy: true)
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591866375/jeffery-erhunse-xE9Z9HZ1Grk-unsplash_iarzkg.jpg')
sphere14.photos.attach(io: file, filename: 'spheres/141.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591866376/emiel-molenaar-c6___zGObUc-unsplash_se3ukj.jpg')
sphere14.photos.attach(io: file, filename: 'spheres/142.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591866377/sergey-shmidt-koy6FlCCy5s-unsplash_z6nfwv.jpg')
sphere14.photos.attach(io: file, filename: 'spheres/143.png', content_type: 'image/png')

sphere15 = Sphere.create!(title: "Balcony paradise!", address: "Taborstr. 15, Berlin", description: "Charming Tuscany-style get-away in the heart of Kreuzberg!", cost_per_day: 35, user_id: user3.id, barbecue: false, balcony: true, garden: false, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: true)
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865993/atte-gronlund-JiphyElpixM-unsplash_w7rblk.jpg')
# sphere15.photos.attach(io: file, filename: 'spheres/151.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/evren-aydin-k_-rJeU2XTw-unsplash_srglvw.jpg')
# sphere15.photos.attach(io: file, filename: 'spheres/152.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/kanan-khasmammadov-RIsKOU4cAd4-unsplash_sekqel.jpg')
# sphere15.photos.attach(io: file, filename: 'spheres/153.png', content_type: 'image/png')


sphere16 = Sphere.create!(title: "The perfect workplace", address: "Simon-Dach-Str. 11, Berlin", description: "Everything you need to get all your work done in style - including highspeed internet and a big desk!", cost_per_day: 30, user_id: user3.id, barbecue: false, balcony: false, garden: false, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: false)
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865993/atte-gronlund-JiphyElpixM-unsplash_w7rblk.jpg')
# sphere16.photos.attach(io: file, filename: 'spheres/161.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/evren-aydin-k_-rJeU2XTw-unsplash_srglvw.jpg')
# sphere16.photos.attach(io: file, filename: 'spheres/162.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/kanan-khasmammadov-RIsKOU4cAd4-unsplash_sekqel.jpg')
# sphere16.photos.attach(io: file, filename: 'spheres/163.png', content_type: 'image/png')

sphere17 = Sphere.create!(title: "A green garden dream!", address: "Gartenstr. 40, 10137 Berlin", description: "Work or simply relax in a beautiful garden and finish your day with a bbq on our terrace!", cost_per_day: 30, user_id: user3.id, barbecue: true, balcony: false, garden: true, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: true, pet_friendly: true, cozy: true)
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865993/atte-gronlund-JiphyElpixM-unsplash_w7rblk.jpg')
# sphere17.photos.attach(io: file, filename: 'spheres/171.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/evren-aydin-k_-rJeU2XTw-unsplash_srglvw.jpg')
# sphere17.photos.attach(io: file, filename: 'spheres/172.png', content_type: 'image/png')
# file = URI.open('https://res.cloudinary.com/kathavk/image/upload/v1591865994/kanan-khasmammadov-RIsKOU4cAd4-unsplash_sekqel.jpg')
# sphere17.photos.attach(io: file, filename: 'spheres/173.png', content_type: 'image/png')

sphere18 = Sphere.create!(title: "greenhouse atelier for artists", description: "Hi everyone! My name is Klaus and I'm a painter from East Germany. I'm gladly sharing a part of my atelier in a greenhouse my wife and I built few years ago in the back of our garden. It's the perfect place to reconnect with nature and boost your creativity. Feel free to reach out if you have questions!", address: "Engelbecken, Berlin", cost_per_day: 10, user_id: user1.id, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

sphere19 = Sphere.create!(title: "chill work spot in beer brewery in hip x-berg", description:"We're running a small family business and love being surrounded by good energies! Here, you'll find a friendly and relaxing atmosphere with always some good music in the background. Bonus: enjoy some free beers from us at the end of the day!", address: "Oranienstrasse 37, Berlin", cost_per_day: 15, user_id: user2.id, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)


sphere20 = Sphere.create!(title: "quiet spot next to private pond", description:"Enjoy the nice sounds of our willows in the wind while working and sipping a fresh lemonade.", address: "Bruno-Bauer-Strasse 15, Berlin", cost_per_day: 15, user_id: user1.id, barbecue: false, balcony: false, garden: true, terrace: false, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: false, pet_friendly: true, cozy: false)

sphere21 = Sphere.create!(title: "rooftop for offsite meetings for teams up to 12 ppl", description:"Have an amazing view of busy Berlin while working. You can either work in or outside with spacious tables and projectors. We also have a mini bar and an amazing sound system you can also enjoy throughout the day. Perfect for teams up to 8 people. Snacks and drinks can be prepared upon request.", address: "Greifswalderstrasse 212, Berlin", cost_per_day: 40, user_id: user2.id, barbecue: true, balcony: false, garden: true, terrace: true, plants: false, quiet: true, sunny: true, spacious_desk: true, highspeed_wifi: true, pet_friendly: false, cozy: false)

sphere22 = Sphere.create!(title: "large terrace with highspeed wifi near Tempelhofer feld ", description:"We're Nora and Peter, two graphic designers from Latvia. Come have a break and indulge yourself some fresh air on our lovely terrace, we'll take care of the rest! ", address: "Schillerpromenade 9, Berlin", cost_per_day: 15, user_id: user1.id, barbecue: false, balcony: false, garden: false, terrace: true, plants: true, quiet: true, sunny: true, spacious_desk: false, highspeed_wifi: true, pet_friendly: true, cozy: false)


puts "Finished!"
