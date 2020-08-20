# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
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
puts "Creating X-wing..."
vehicle = Vehicle.new(
  name: "X-wing",
  category: "espace",
  daily_price: '18000',
  description: "Le X-wing, est le chasseur stellaire de George Lucas. N'ayant plus d'idée, Johnny Deep a voulu le louer pour Pirates des Caraïbes 6.",
  capacity: '1'
)
file0 = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1597753536/xwingt65_imv6_nazpjt.jpg')
vehicle.photos.attach(io: file0, filename: 'x-wing0.jpg', content_type: 'image/jpg')
file1 = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1597753599/X_Wing_Starfighter_600_0006.jpgDE8B6D0B-CBBD-4E69-8CE4-E31B237323E6DefaultHQ_py76av.jpg')
vehicle.photos.attach(io: file1, filename: 'x-wing1.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1597754117/maxresdefault_s9dyrv.jpg')
vehicle.photos.attach(io: file2, filename: 'x-wing2.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Batmobile..."

vehicle = Vehicle.new(
  name: "Batmobile",
  category: "terre",
  daily_price: '11000',
  description: "La Batmobile est le véhicule de Batman qui est heureux de vous la louer 🙂 et l'homme chauve sourit.",
  capacity: '1'
)
file0 = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1597752884/batmobile-310x165_2x_y2vptn.jpg')
vehicle.photos.attach(io: file0, filename: 'bat0.jpg', content_type: 'image/jpg')
file1 = URI.open('https://res.cloudinary.com/dv1x9ot6j/image/upload/v1597752780/21f739e872e014a5fb19cd504505a96b_zeontj.jpg')
vehicle.photos.attach(io: file1, filename: 'bat1.jpg', content_type: 'image/jpg')
file2 = URI.open('https://images.sudouest.fr/2019/01/23/5c48863366a4bd9d296a4927/widescreen/1000x500/la-batmobile-est-arrivee.jpg?v1')
vehicle.photos.attach(io: file2, filename: 'bat2.jpg', content_type: 'image/jpg')
vehicle.save!

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
puts "Creating Falcon Millenium..."
vehicle = Vehicle.new(
  name: "Falcon Millenium",
  category: "espace",
  daily_price: '45000',
  description: "_",
  capacity: '19'
)
file0 = URI.open('https://i.pinimg.com/originals/98/4d/1b/984d1b8cb655542254a702ab8b01f80d.jpg')
vehicle.photos.attach(io: file0, filename: 'FalconMil.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Armure d'Iron Man..."
vehicle = Vehicle.new(
  name: "Armure d'Iron Man",
  category: "terre",
  daily_price: '105000',
  description: "_",
  capacity: '1'
)
file0 = URI.open('https://letiroirajeux.fr/wp-content/uploads/2020/07/76F18261-2BB4-4B9E-9775-5CC8F878C257-800x445.jpeg')
vehicle.photos.attach(io: file0, filename: 'IronMan.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Sous-Marin Nucléaire..."
vehicle = Vehicle.new(
  name: "Sous-Marin Nucléaire",
  category: "mer",
  daily_price: '99000',
  description: "_",
  capacity: '52'
)
file0 = URI.open('https://www.meretmarine.com/objets/4231.jpg')
vehicle.photos.attach(io: file0, filename: 'SMN.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating La Santa-Maria..."
vehicle = Vehicle.new(
  name: "La Santa-Maria",
  category: "mer",
  daily_price: '600',
  description: "_",
  capacity: '25'
)
file0 = URI.open('https://www.actu-direct.fr/rep/rep_article/2018-07-12_080546_DSCN0282.JPG')
vehicle.photos.attach(io: file0, filename: 'CLSM.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Char Leclerc..."
vehicle = Vehicle.new(
  name: "Char Leclerc",
  category: "terre",
  daily_price: '15000',
  description: "_",
  capacity: '3'
)
file0 = URI.open('https://www.guer-coetquidan-broceliande.fr/bisto/coet/campchars/leclerc_3.jpg')
vehicle.photos.attach(io: file0, filename: 'Leclerc.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Char Panzer..."
vehicle = Vehicle.new(
  name: "Char Panzer",
  category: "terre",
  daily_price: '10000',
  description: "_",
  capacity: '4'
)
file0 = URI.open('https://upload.wikimedia.org/wikipedia/commons/a/ac/PzIV.Saumur.000a5s6s.jpg')
vehicle.photos.attach(io: file0, filename: 'Panzer.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Supermarine Spitfire..."
vehicle = Vehicle.new(
  name: "Spitfire",
  category: "air",
  daily_price: '1000',
  description: "_",
  capacity: '2'
)
file0 = URI.open('https://cdn-3d.niceshops.com/upload/image/product/large/default/revell-supermarine-spitfire-mkiia-1-pcs-304157-fr.jpg')
vehicle.photos.attach(io: file0, filename: 'Spitfire.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating HoverBoard Green Goblin..."
vehicle = Vehicle.new(
  name: "HoverBoard Green Goblin",
  category: "air",
  daily_price: '12000',
  description: "_",
  capacity: '1'
)
file0 = URI.open('https://bradenkelley.com/wp-content/uploads/2018/03/Green-Goblin-Flying-1024x844.jpg')
vehicle.photos.attach(io: file0, filename: 'Hoverboard.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Rafale..."
vehicle = Vehicle.new(
  name: "Rafale",
  category: "air",
  daily_price: '30000',
  description: "_",
  capacity: '2'
)
file0 = URI.open('https://images.dassault-aviation.com/f_auto,q_auto,g_center,dpr_auto/wp-auto-upload/1/files/2017/10/DA00016390_Si.jpg')
vehicle.photos.attach(io: file0, filename: 'Rafale.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Nautilus..."
vehicle = Vehicle.new(
  name: "Nautilus",
  category: "mer",
  daily_price: '5000',
  description: "_",
  capacity: '40'
)
file0 = URI.open('https://i.pinimg.com/originals/a4/f1/1e/a4f11e009c003e76e8043fc9cf7ab6d8.jpg')
vehicle.photos.attach(io: file0, filename: 'Nautilus.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Porte-Avion..."
vehicle = Vehicle.new(
  name: "Porte-Avion",
  category: "mer",
  daily_price: '200000',
  description: "_",
  capacity: '2000'
)
file0 = URI.open('https://www.meretmarine.com/sites/default/files/styles/mem_1000/public/new_objets_drupal/cdg2_2.jpg')
vehicle.photos.attach(io: file0, filename: 'Porteavion.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Executor class Super Destroyer..."
vehicle = Vehicle.new(
  name: "Executor class Super Star Destroyer",
  category: "espace",
  daily_price: '200000',
  description: "_",
  capacity: '2000'
)
file0 = URI.open('https://vignette.wikia.nocookie.net/starwars/images/3/30/Executor_BF2.png/revision/latest?cb=20180903230846')
vehicle.photos.attach(io: file0, filename: 'Superdestroyer.jpg', content_type: 'image/png')
vehicle.save!
puts "Creating Bubblebee..."
vehicle = Vehicle.new(
  name: "Bubblebee",
  category: "terre",
  daily_price: '54000',
  description: "_",
  capacity: '5'
)
file0 = URI.open('https://images7.alphacoders.com/517/517778.jpg')
vehicle.photos.attach(io: file0, filename: 'Bubblebee.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Etoile Noire..."
vehicle = Vehicle.new(
  name: "Etoile Noire",
  category: "espace",
  daily_price: '35400',
  description: "_",
  capacity: '1500'
)
file0 = URI.open('https://media.anakinworld.com/uploads/entries/original/vaisseau-etoile-noire-i.jpg')
vehicle.photos.attach(io: file0, filename: 'EtoileNoire.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Tigre..."
vehicle = Vehicle.new(
  name: "Tigre",
  category: "air",
  daily_price: '6000',
  description: "_",
  capacity: '1'
)
file0 = URI.open('https://www.helicopassion.com/images/TIGR/Espagne/PRADA89h.jpg')
vehicle.photos.attach(io: file0, filename: 'Tigre.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Cheval Blanc d'Henri IV..."
vehicle = Vehicle.new(
  name: "Cheval Blanc d'Henri IV",
  category: "terre",
  daily_price: '20',
  description: "_",
  capacity: '1'
)
file0 = URI.open('https://p6.storage.canalblog.com/68/62/1309854/106788352_o.jpg')
vehicle.photos.attach(io: file0, filename: 'ChevalBlanc.jpg', content_type: 'image/jpg')
vehicle.save!
puts "Creating Char Tesla..."
vehicle = Vehicle.new(
  name: "Char Tesla",
  category: "terre",
  daily_price: '3000',
  description: "_",
  capacity: '5'
)
file0 = URI.open('https://alerte-rouge.e-monsite.com/medias/album/images/38630828ps3-command-et-conquer-red-alert-3-1212412153-9-1-jpg.jpg')
vehicle.photos.attach(io: file0, filename: 'Tesla.jpg', content_type: 'image/jpg')
vehicle.save!
