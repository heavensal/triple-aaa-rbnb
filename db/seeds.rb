# def rating(celebrity, comment, rating)
#   review = Review.new(comment: comment, rating: rating)
#   Review.user = celebrity.user
#   Review.celebrity = celebrity
#   review.save!
# end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

puts "On reset la db"
Review.destroy_all
Booking.destroy_all
Celebrity.destroy_all

puts "Adam te crée 8 célébrités"

celebrity = Celebrity.new(name: "Rihanna", address: "21 Rue Haxo 13001 Marseille, France", price: rand(0..500), user_id: 2)
# file = URI.open("https://images.bfmtv.com/qLN34DPsDwHHc8flGNofxdB9VFQ=/0x42:2048x1194/2048x0/images/Rihanna-le-26-septembre-2022-a-Hollywood-1508835.jpg")
# celebrity.photos.attach(io: file, filename: "rihanna.jpg", content_type: "image/jpg")
celebrity.save!

celebrity = Celebrity.new(name: "Beyonce", address: "48 rue du Lacydon 13002 Marseille, France", price: rand(0..500), user_id: 2)
celebrity.save!

celebrity = Celebrity.new(name: "Michael Jackson", address: "15 rue de Ruffi 13003 Marseille, France", price: rand(0..500), user_id: 2)
celebrity.save!

celebrity = Celebrity.new(name: "Jennifer", address: "13 Rue Cappatti 06100 Nice, France", price: rand(0..500), user_id: 2)
celebrity.save!

celebrity = Celebrity.new(name: "Anais", address: " 13 Rue François Boyer-Fonfrède 31100 Toulouse, France", price: rand(0..500), user_id: 2)
celebrity.save!

celebrity = Celebrity.new(name: "Neymar", address: "15 Rue de la Paix 75002 Paris, France", price: rand(0..500), user_id: 1)
celebrity.save!

celebrity = Celebrity.new(name: "Britney Spears", address: "141 Rue Marcadet 75018 Paris, France", price: rand(0..500), user_id: 1)
celebrity.save!

celebrity = Celebrity.new(name: "Dylane", address: "1 Rue Saint-Henri 31100 Toulouse, France", price: rand(0..500), user_id: 1)
celebrity.save!

puts "C'est fait !"
