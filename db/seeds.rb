# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

BikeAd.destroy_all
User.destroy_all

yamaha = 'Yamaha'
honda = 'Honda'
bmw = 'BMW'
ducati = 'Ducati'
harley = 'Harley-Davidson'

cross = 'Cross'
enduro = 'Enduro'
sport = 'Sport'

antoine = User.create!(email: 'antoine.legoix@gmail.com', password: '123456', first_name: 'Antoine', last_name: 'Legoix', address: "L'adresse d'Antoine", bio: "Bikes rule!")
fabien = User.create!(email: 'thoux@gmail.com', password: '123456', first_name: 'Fabien', last_name: 'Berthoux', address: "L'adresse de Fabien", bio: "Yo!")
simon = User.create!(email: 'simboutin@gmail.com', password: '678910', first_name: 'Simon', last_name: 'Boutin', address: "L'adresse de Simon")


bike1 = BikeAd.new(model: 'BMW R1200', brand: bmw, category: enduro, year: '2020', address: '12 rue de la République 69001 Lyon', price_per_day: '100', available: true, user_id: antoine.id)
bike2 = BikeAd.new(model: 'Harley-Davidson Sportster', brand: harley, category: sport, year: '2015', address: '30 allée du bourg 30000 Bordeaux', price_per_day: '80', user_id: simon.id)
bike3 = BikeAd.new(model: 'Ducati Monster', brand: ducati, category: cross, year: '2015', address: '100 impasse de la Poste 75010 Paris', price_per_day: '80', available: false, user_id: fabien.id)

bike1.save!
bike2 .save!
bike3.save!