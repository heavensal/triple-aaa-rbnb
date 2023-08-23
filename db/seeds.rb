# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

puts "On reset la db"
Celebrity.destroy_all

puts "Adam te crée 8 célébrités"

celebrity = Celebrity.new(name: "Rihanna", address: Faker::Address.full_address, price: rand(0..100_000), user_id: 1)
# file = URI.open("https://images.bfmtv.com/qLN34DPsDwHHc8flGNofxdB9VFQ=/0x42:2048x1194/2048x0/images/Rihanna-le-26-septembre-2022-a-Hollywood-1508835.jpg")
# celebrity.photos.attach(io: file, filename: "rihanna.jpg", content_type: "image/jpg")
celebrity.save!

celebrity = Celebrity.new(name: "Beyonce", address: Faker::Address.full_address, price: rand(0..100_000), user_id: 1)
celebrity.save!

celebrity = Celebrity.new(name: "Michael Jackson", address: Faker::Address.full_address, price: rand(0..100_000), user_id: 1)
celebrity.save!

celebrity = Celebrity.new(name: "Sean Paul", address: Faker::Address.full_address, price: rand(0..100_000), user_id: 1)
celebrity.save!

rand(1..4).times do
  booking = Booking.new(date_debut: "2023-09-15 [06:36:15]", date_fin: "2024-10-12 [00:00:00]", user_id: 1)
  booking.celebrity = celebrity
  puts booking.celebrity.name
  puts booking.user.email
  booking.save!
  p booking
end

puts "1 super héro de plus fait !"
sleep(0.1)

# end

#{rand(2023..2025)}-#{rand(10..12)}-#{rand(10..30)} [#{rand(10..11)}:#{rand(10..59)}#{rand(10..59)}]
