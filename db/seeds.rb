# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

  # Cleaning DB
  print "Destroying events and sports... "
  Event.destroy_all
  Sport.destroy_all
  puts "✅"

  # Creating Sports
  print "Creating sports... "

  sports = [
    { name: "Football", icon: "https://images.unsplash.com/photo-1626248801379-51a0748a5f96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80" },
    { name: "Tennis", icon: "https://images.unsplash.com/photo-1554068865-24cecd4e34b8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80" },
    { name: "Basketball", icon: "https://images.unsplash.com/photo-1546519638-68e109498ffc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2090&q=80" },
    { name: "Volleyball", icon: "https://images.unsplash.com/photo-1612872087720-bb876e2e67d1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3407&q=80" },
    { name: "Handball", icon: "https://images.unsplash.com/photo-1513028738826-f000cded30a4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3272&q=80"},
    { name: "Rugby", icon: "https://images.unsplash.com/photo-1512299286776-c18be8ed6a1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80" },
    { name: "Running", icon: "https://images.unsplash.com/photo-1571008887538-b36bb32f4571?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" },
    { name: "Swimming", icon: "https://images.unsplash.com/photo-1438029071396-1e831a7fa6d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3250&q=80" },
    { name: "Cycling", icon: "https://images.unsplash.com/photo-1545575439-3261931f52f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80" },
    { name: "Golf", icon: "https://images.unsplash.com/photo-1593111774642-a746f5006b7b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2099&q=80" },
    { name: "Hiking", icon: "https://images.unsplash.com/photo-1458442310124-dde6edb43d10?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" },
    { name: "Yoga", icon: "https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" },
    { name: "Boxing", icon: "https://images.unsplash.com/flagged/photo-1574005280900-3ff489fa1f70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"  },
    { name: "Skiing", icon: "https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80" },
    { name: "Snowboarding", icon: "https://images.unsplash.com/photo-1502680390469-be75c86b636f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" },
    { name: "Surfing", icon: "https://images.unsplash.com/photo-1580237754524-f26ed36fa85c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2531&q=80" },
  ]

  sports.each do |sport_attributes|
    sport = Sport.create!(sport_attributes)
  end
  
  puts "✅"

  # Creating Events
  print "Creating events... "

  50.times do
    sport = Sport.all.sample

    Event.create!(
      sport_id: sport.id,
      name: ["#{sport.name} time!", "#{sport.name} hangout!", "#{sport.name} meetup", "Looking for #{sport.name} buddies", "#{sport.name} competition", "#{sport.name} practice"].sample,
      address: ["23 Zollergasse, Vienna", "14 Avenue des Champs-Élysées, Paris", "7 St. Patrick's Square, Dublin", "42 Alexanderplatz, Berlin", "9 Gran Vía, Madrid", "16 Piazza del Duomo, Rome", "31 Trafalgar Square, London", "12 Herengracht, Amsterdam", "27 Karl Johans gate, Oslo"].sample,
      level: ["Beginner", "Intermediate", "Advanced"].sample,
      date: Faker::Date.between(from: '2023-07-01', to: '2023-08-31'),
      participant_number: rand(2..10),
      duration: rand(1..3),
      user_id: rand(10..12), # locally (you might need to change this based on your local user ids)
      # user_id: [12, 13, 15, 16, 17, 18].sample, # heroku
      description: "Looking for company to do my favorite sport"
    )
  end

  puts "✅"

  puts "Ready! 🎉"
