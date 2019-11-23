# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# p User.find_or_create_by!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')

def fake_rating
    (1..5).to_a.sample
end

def fake_start_and_end
    start = (1..21).to_a.sample
    finish = start + [4, 7, 10, 14].sample
    [Faker::Date.forward(days: start), Faker::Date.forward(days: finish)]
end
SHIPIMAGE_URL = "https://loremflickr.com/300/300/ship"
user = User.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
p user
user_profile = UserProfile.find_or_create_by!(ex_email: user.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username)
# Real cruiselines data
cruiselines = ['Carnival', 'Royal Caribbean', 'Disney Cruise']
cruiselines.each do |cruiseline|
  CruiseLine.find_or_create_by!(name: cruiseline)
end
#Fake cruiseline data
cruise_line = CruiseLine.find_or_create_by!(name: Faker::Lorem.words(number: 4).map{|w| w.capitalize}.join(' '))
p cruise_line

# Real ship data
carnivalships = ["Carnival Horizon", "Carnival Vista", "Carnival Breeze", "Carnival Magic", "Carnival Dream"]
royalcaribbean = ['Wonder of the Seas', 'Odyssey of the Seas', 'Symphony of the Seas', 'Harrmony of the Seas', 'Oasis of the Seas', 'Allure of the Seas']
disneycruise = ['Disney Magic', 'Disney Wonder', 'Disney Dream', 'Disney Fantasy']

carnivalships.each do |ship|
  Ship.find_or_create_by!(name: ship, cruise_line_id: 1)
end
royalcaribbean.each do |ship|
  Ship.find_or_create_by!(name: ship, cruise_line_id: 2)
end
disneycruise.each do |ship|
  Ship.find_or_create_by!(name: ship, cruise_line_id: 3)
end
#Fake data ships
ships = 10.times.map{ Ship.find_or_create_by!(name: Faker::Lorem.word.capitalize, cruise_line: cruise_line)}
ships.each {|ship| cruise_line.ships << ship}
cruise_line.ships.each {|ship| p ship}
ship_images = ships.map{|ship| ShipImage.find_or_create_by!(url: SHIPIMAGE_URL, ship: ship)}

reviews = ships.map{|ship| Review.find_or_create_by!(user_profile: user_profile, ship: ship, body: Faker::Lorem.paragraph, rating: fake_rating )}
p reviews
comments = reviews.map{|review| Comment.create!(review: review, user_profile: user_profile, body:Faker::Lorem.sentence)}
p comments
helpfuls = reviews.map{|review| Helpful.find_or_create_by!(review: review, user_profile: user_profile)}

port = Port.find_or_create_by!(name: Faker::Lorem.word.capitalize)
p port

port_image = PortImage.find_or_create_by!(url: SHIPIMAGE_URL, port: port)
region = Region.find_or_create_by!(name: Faker::Address.country, description: Faker::Lorem.paragraph)
p region

start, end_ = fake_start_and_end
voyage = Voyage.find_or_create_by!(start: start, end: end_, region: region)
p voyage
voyage_port = VoyagePort.find_or_create_by!(port: port, voyage: voyage)
itineraries = ships.map{|ship| Itinerary.find_or_create_by!(name: Faker::Lorem.word.capitalize, ship: ship, voyage_port: voyage_port)}
itineraries.each do |itinerary|
    p itinerary
    p itinerary.voyage_port.voyage
    p itinerary.voyage_port.voyage.region
    p itinerary.voyage_port.port
end

puts "PASSED"
