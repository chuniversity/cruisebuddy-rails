# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# p User.find_or_create_by!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
require Rails.root.join('db/seeds_lib', 'seeds_data.rb')
require Rails.root.join('db/seeds_lib', 'voyage_record_generation')

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
#p user
user_profile = UserProfile.find_or_create_by!(ex_email: user.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username)

#creating additional users
(2..10).each do |i|
  email = "example#{1}@mail.com"
  user = User.create!(email: email , password: '123123123' , password_confirmation: '123123123')
  UserProfile.find_or_create_by!(ex_email: user.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username)
end

#Cruise lines into db
CRUISELINES.each do |cruiseline|
  CruiseLine.find_or_create_by!(name: cruiseline)
end

#Ships into db
SHIPS_COLLECTION.each do |cruise_line_id, ships_ids|
  ships_ids.each do |ship_id, ship_data|
    Ship.find_or_create_by!(
      name: ship_data[:ship_name], 
      cruise_line_id: cruise_line_id, 
      description: ship_data[:description],
      url: ship_data[:ship_url]
    )
  end
end

#Ports into db
REGIONS.each do |region, ports|
  ports.each do |port|
    Port.find_or_create_by!(port_name: port)
  end
end 

#Voyage dates
voyage_data((1..5),2,[10,14],'Miami') # for Carnival Cruise
voyage_data((6..11),1,[14,21],'Dover') # for Royal Caribbean
voyage_data((15..15),3,[3,7],'Miami') # for Disney

#Reviews
(1..100).each do |i|
  Review.find_or_create_by!(
    body: Faker::Lorem.paragraph(sentence_count: 10),
    rating: (1..5).to_a.sample,
    user_profile_id: (1..10).to_a.sample,
    ship_id: (1..15).to_a.sample
  )
end
puts "PASSED"