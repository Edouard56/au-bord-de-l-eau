# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Boat.create!(name: "la rieuse", address: "dinard", description: "un superbe chalutier pour pecher avec vos copains", price_per_day: 30, nb_of_passengers: 4)
Boat.create!(name: "le matisse", address: "lancieux", description: "une belle virée pêche au bar entre copains", price_per_day: 25, nb_of_passengers: 2)
Boat.create!(name: "le titanic", address: "groenland", description: "Visite des fonds marins au large du Groenland", price_per_day: 300, nb_of_passengers: 300)
