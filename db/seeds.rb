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
  password: '1234567',
  address: "Lalilalou, Tout va bien",
  phone_number: "Je donne pas mon 07"
  )

User.create!(
  name: "Olivier",
  email: "olivier@gmail.com",
  password: '123456',
  address: "Pas loin d'ici et là",
  phone_number: "Je donne pas mon 06"
  )

User.create!(
  name: "Sam",
  email: "sam@gmail.com",
  password: '113344',
  address: "Etoile Noire, Space",
  phone_number: "Téléphone rouge"
  )

User.create!(
  name: "Théo",
  email: "theo@gmail.com",
  password: '111222',
  address: "Pandora Jungle",
  phone_number: "Système racinaire en local"
  )

puts "Creating vehicles..."
20.times do
  Vehicle.create!(
    name: Faker::Space.launch_vehicle,
    category: Vehicle::CATEGORIES.sample,
    daily_price: Faker::Number.between(from: 35, to: 35000),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.",
    capacity: Random.rand(1..50)
  )
end

puts "Creating x-wing..."
Vehicle.create!(
  name: "x-wing",
  category: "espace",
  daily_price: '18000',
  description: "Le X-wing, est le chasseur stellaire de George Lucas. N'ayant plus d'idée, Johnny Deep a voulu le louer pour Pirates des Caraïbes 6.",
  capacity: Random.rand(1..50)
)

puts "Creating Batmobile..."
Vehicle.create!(
  name: "Batmobile",
  category: "terre",
  daily_price: '11000',
  description: "La Batmobile est le véhicule de Batman qui est heureux de vous la louer 🙂 et l'homme chauve sourit.",
  capacity: Random.rand(1..50)
)

puts "Creating orders..."
users = User.all
user1 = users[0]
user2 = users[1]

start_date = Date.today+Random.rand(0..30)
end_date = start_date+Random.rand(1..30)
vehicle = Vehicle.all.sample
total_amount = vehicle.daily_price*(end_date - start_date).to_i
Order.create!(
  start_date: start_date,
  end_date: end_date,
  user: user1,
  vehicle: vehicle,
  total_amount: total_amount
)

10.times do
  start_date = Date.today+Random.rand(0..30)
  end_date = start_date+Random.rand(1..30)
  vehicle = Vehicle.all.sample
  total_amount = vehicle.daily_price*(end_date - start_date).to_i
  Order.create!(
    start_date: start_date,
    end_date: end_date,
    user: user2,
    vehicle: vehicle,
    total_amount: total_amount
    )
end


