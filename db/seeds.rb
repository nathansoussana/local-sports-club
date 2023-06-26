# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# puts "Creating sports..."

# Sport.create!([
#   { name: "Football" }, 
#   { name: "Tennis" },
#   { name: "Basketball" },
#   { name: "Volleyball" },
#   { name: "Handball" },
#   { name: "Rugby" },
#   { name: "Running" },
#   { name: "Swimming" },
#   { name: "Cycling" },
#   { name: "Golf" },
#   { name: "Hiking" },
#   { name: "Yoga" },
#   { name: "Boxing" },
#   { name: "Skiing" },
#   { name: "Snowboarding" },
#   { name: "Surfing" },
# ] )

puts "Creating events..."

30.times do
  Event.create!(
    sport_id: rand(1..16),
    name: ["Football", "Tennis", "Basketball", "Volleyball", "Handball", "Rugby", "Running", "Swimming", "Cycling", "Golf", "Hiking", "Yoga", "Boxing", "Skiing", "Snowboarding", "Surfing"].sample,
    address: Faker::Address.full_address,
    level: ["Beginner", "Intermediate", "Advanced"].sample,
    date: Faker::Date.between(from: '2023-06-25', to: '2023-12-31'),
    participant_number: rand(1..10),
    duration: rand(1..3),
    user_id: 1,
    description: Faker::Lorem.paragraph(sentence_count: 5)
  )
end

puts "Events created!"