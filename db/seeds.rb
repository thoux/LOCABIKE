# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Booking.delete_all
BikeAd.delete_all
User.delete_all

p "------ SET BIKE MARQUES ------"

yamaha = 'Yamaha'
honda = 'Honda'
bmw = 'BMW'
ducati = 'Ducati'
harley = 'Harley-Davidson'

p "------ SET BIKE MARQUES : OK ------"

p "------ SET BIKE TYPES ------"

cross = 'Cross'
enduro = 'Enduro'
sportive = 'Sportive'
roadster = 'Roadster'

p "------ SET BIKE TYPES : OK ------"


p "------ SET USERS ------"

description = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)

mitch = User.create!(email: 'thoux08+mitch@gmail.com', password: 'buchannon', first_name: 'Mitch', last_name: 'Buchannon', address: "L.A. County Beach Patrol", bio: Faker::TvShows::TheITCrowd.quote )
antoine = User.create!(email: 'antoine.legoix@gmail.com', password: '123456', first_name: 'Antoine', last_name: 'Legoix', address: "L'adresse d'Antoine", bio: Faker::TvShows::TheITCrowd.quote)
fabien = User.create!(email: 'thoux@gmail.com', password: '123456', first_name: 'Fabien', last_name: 'Berthoux', address: "L'adresse de Fabien", bio: Faker::TvShows::TheITCrowd.quote)
simon = User.create!(email: 'simboutin@gmail.com', password: '678910', first_name: 'Simon', last_name: 'Boutin', address: "L'adresse de Simon")

p "------ SET USERS : OK ------"

p "------ SET USER AVATARS ------"
mitch.avatar.attach(
  io: File.open("#{Rails.root}/app/assets/images/avatars/mitch.jpg"),
  filename: 'mitch.jpg',
)

antoine.avatar.attach(
  io: File.open("#{Rails.root}/app/assets/images/avatars/antoine.jpg"),
  filename: 'antoine.jpg',
)

fabien.avatar.attach(
  io: File.open("#{Rails.root}/app/assets/images/avatars/fabien.jpg"),
  filename: 'fabien.jpg',
)

simon.avatar.attach(
  io: File.open("#{Rails.root}/app/assets/images/avatars/simon.jpg"),
  filename: 'simon.jpg',
)

p "------ SET USER AVATARS : OK ------"


p "------ SET USER BANNERS ------"
mitch.banner.attach(
  io: File.open("#{Rails.root}/app/assets/images/banners/mitch-banner.jpg"),
  filename: 'mitch.jpg',
)

antoine.banner.attach(
  io: File.open("#{Rails.root}/app/assets/images/banners/antoine-banner.jpg"),
  filename: 'antoine.jpg',
)

fabien.banner.attach(
  io: File.open("#{Rails.root}/app/assets/images/banners/fabien-banner.jpg"),
  filename: 'fabien.jpg',
)

simon.banner.attach(
  io: File.open("#{Rails.root}/app/assets/images/banners/simon-banner.jpg"),
  filename: 'simon.jpg',
)

p "------ SET USER BANNERS : OK ------"


p "------ SET BIKE_ADS ------"

bike_cbr = BikeAd.new(model: 'CBR 954', brand: honda, category: sportive, year: '2000', address: '12 rue de la République 69001 Lyon', price_per_day: '100', available: true, user_id: antoine.id, description: description)
bike_cbr.save!
bike_cbr.photo.attach(
  io: File.open("#{Rails.root}/app/assets/images/bikes/954-cbr.jpg"),
  filename: '954-cbr.jpg',
)

mitch_bike = BikeAd.new(model: 'CVO STREET GLIDE', brand: harley, category: sportive, year: '2000', address: '175 r Marcadet, 75018 Paris', price_per_day: '90', available: true, user_id: mitch.id, description: description)
mitch_bike.save!
mitch_bike.photo.attach(
  io: File.open("#{Rails.root}/app/assets/images/bikes/harley-1.jpeg"),
  filename: 'harley-1.jpeg',
)


mitch_bike_2 = BikeAd.new(model: '450 CRF', brand: honda, category: cross, year: '2020', address: '40 Avenue de Clichy, 75018 Paris', price_per_day: '80', available: true, user_id: mitch.id, description: description)
mitch_bike_2.save!
mitch_bike_2.photo.attach(
  io: File.open("#{Rails.root}/app/assets/images/bikes/mitch-bike.jpg"),
  filename: 'mitch-bike.jpg',
)

fabien_bike = BikeAd.new(model: 'Café Racer BMW', brand: bmw, category: roadster, year: '2020', address: '46 Faubourg Saint Honoré, 75018 Paris', price_per_day: '110', available: true, user_id: fabien.id, description: description)
fabien_bike.save!
fabien_bike.photo.attach(
  io: File.open("#{Rails.root}/app/assets/images/bikes/bmw-bike.jpg"),
  filename: 'bmw-bike.jpg',
)


simon_bike = BikeAd.new(model: 'Café Racer BMW', brand: bmw, category: roadster, year: '2020', address: '73  rue Nationale, 75018 Paris', price_per_day: '210', available: true, user_id: simon.id, description: description)
simon_bike.save!
simon_bike.photo.attach(
  io: File.open("#{Rails.root}/app/assets/images/bikes/bmw-bike-2.jpg"),
  filename: 'bmw-bike-2.jpg',
)
p "------ SET BIKE_ADS : OK ------"
# bike1 = BikeAd.new(model: 'BMW R1200', brand: bmw, category: enduro, year: '2020', address: '12 rue de la République 69001 Lyon', price_per_day: '100', available: true, user_id: antoine.id, description: description)
# bike2 = BikeAd.new(model: 'Harley-Davidson Sportster', brand: harley, category: sport, year: '2015', address: '30 allée du bourg 30000 Bordeaux', price_per_day: '80', user_id: simon.id, description: description)
# bike3 = BikeAd.new(model: 'Ducati Monster', brand: ducati, category: cross, year: '2015', address: '100 impasse de la Poste 75010 Paris', price_per_day: '80', available: false, user_id: fabien.id, description: description)


# bike2 .save!
# bike3.save!
