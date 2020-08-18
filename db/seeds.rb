# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Order.destroy_all
puts "Orders destroyed!"
User.destroy_all
puts "Users destroyed!"
Vehicle.destroy_all
puts "Vehicles destroyed!"


puts "Creating users..."

User.create!(
  name: "Margot",
  email: "margot@gmail.com",
  password: '1234567'
  )

User.create!(
  name: "Olivier",
  email: "olivier@gmail.com",
  password: '123456'
  )

User.create!(
  name: "Sam",
  email: "sam@gmail.com",
  password: '113344'
  )

User.create!(
  name: "Théo",
  email: "theo@gmail.com",
  password: '111222'
  )

puts "Creating vehicles..."
20.times do
  Vehicle.create!(
    name: Faker::Space.launch_vehicle,
    category: Vehicle::CATEGORIES.sample,
    daily_price: Faker::Number.between(from: 35, to: 35000),
    capacity: Random.rand(1..50)
  )
end

puts "Creating orders..."
users = User.all
user1 = users[0]
user2 = users[1]

Order.create!(
  start_date: Date.today+3,
  end_date: Date.today+5,
  user: user1,
  vehicle: Vehicle.all.sample,
  )

10.times do
  start_date = Date.today+Random.rand(0..30)
  end_date = start_date+Random.rand(1..30)
  Order.create!(
    start_date: start_date,
    end_date: end_date,
    user: user2,
    vehicle: Vehicle.all.sample,
    )
end


