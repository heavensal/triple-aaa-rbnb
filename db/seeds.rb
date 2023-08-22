# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Celebrity.destroy_all
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

# puts "je crée 3 faux utilisateurs"
puts "Adam te crée 10 superhéros"

10.times do
  celebrity = Celebrity.new(name: Faker::Superhero.name, rating: rand(0..5), price: rand(0..100_000), user_id: 1)
  rand(1..4).times do
    file = URI.open(Faker::Avatar.image(slug: "my-own-slug", size: "300x300", format: "jpg"))
    celebrity.photos.attach(io: file, filename: "#{Faker::Superhero.name}.jpg", content_type: "image/jpg")
  end
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
end

puts "tu dois avoir 10 super héros avec 1 a 4 photos chacun !"

# def create_bookings(celebrity)
#   booking = Booking.new(date_debut: "2023-mm-dd [hh:mm:ss]", date_debut: "yyyy-mm-dd [hh:mm:ss]")

# end

#{rand(2023..2025)}-#{rand(10..12)}-#{rand(10..30)} [#{rand(10..11)}:#{rand(10..59)}#{rand(10..59)}]
