# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Celebrity.destroy_all
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

file = URI.open("https://imgs.smoothradio.com/images/224840?width=2480&crop=1_1&signature=coh17sFPwlsyi0gj9FdZWvlLMFQ=")
celebrity = Celebrity.new(name:"Michael Jackson", rating: 5, price: 1500, user_id: 1)
celebrity.photo.attach(io: file, filename: "jackson.png", content_type: "image/png")
celebrity.save!

file_rihanna = URI.open("https://images.bfmtv.com/qLN34DPsDwHHc8flGNofxdB9VFQ=/0x42:2048x1194/2048x0/images/Rihanna-le-26-septembre-2022-a-Hollywood-1508835.jpg")
celebrity_rihanna = Celebrity.new(name:"Rihanna", rating: 5, price: 1500, user_id: 1)
celebrity_rihanna.photo.attach(io: file_rihanna, filename: "rihanna.jpg", content_type: "image/png")
celebrity_rihanna.save!

file_beyonce = URI.open("https://media.gqmagazine.fr/photos/64d204f793010afab4ecf5ed/16:9/pass/Beyonce%20Renaissance%20Tour%20.png")
celebrity_beyonce = Celebrity.new(name:"Beyonce", rating: 5, price: 1500, user_id: 1)
celebrity_beyonce.photo.attach(io: file_beyonce, filename: "beyonce.png", content_type: "image/png")
celebrity_beyonce.save!


puts "c'est bon"
