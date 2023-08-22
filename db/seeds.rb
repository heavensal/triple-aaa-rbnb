# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Celebrity.destroy_all
Celebrity.create(name: "Michael Jackson", rating: 5, price: 1500, user_id: 1)
Celebrity.create(name: "Rihanna", rating: 4.2, price: 2500, user_id: 1)
Celebrity.create(name: "Beyonce", rating: 3, price: 3000, user_id: 1)
puts "c'est bon"
