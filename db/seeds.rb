# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# p User.find_or_create_by!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')

require('seeds_data.rb')

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

#Cruise Line


cruiselines.each do |cruiseline|
  CruiseLine.find_or_create_by!(name: cruiseline)
end

#Ships
ships_collection.each do |cruise_line_id, ships_ids|
  ships_ids.each do |ship_id, ship_data|
    Ship.find_or_create_by!(
      name: ship_data[:ship_name], 
      cruise_line_id: cruise_line_id, 
      description: Faker::Lorem.paragraph(sentence_count: 10),
      url: ship_data[:ship_url]
    )
  end
end


#list of ports
regions = {departing_ports: %w{ Miami },
           europe:  %w{ London Lisbon Rome Sicily Venice Split Athens Crete Israel Alexandria },
           caribbean: %w{ Puerto\ Rico Jamaica Bahamas Bermuda Key\ West US\ Virgin\ Islands},
}
#Inserting port list to table
regions.each do |region, ports|
  ports.each do |port|
    Port.find_or_create_by!(port_name: port)
  end
end 

#list of ports dependent on duration of cruise
visited_ports = { 
                european:  {
                            21 => %w{ London Lisbon Rome Sicily Venice Split Athens Crete Israel Alexandria },
                            14 => %w{ London Lisbon Rome Sicily Venice Split Athens }
                           },
                caribbean: {
                            14 => %w{ Puerto\ Rico Jamaica Bahamas Bermuda Key\ West US\ Virgin\ Islands},
                            10 => %w{ Puerto\ Rico Jamaica Bahamas Bermuda Virgin\ Islands},
                            7  => %w{ Puerto\ Rico Jamaica Bahamas Bermuda},
                            3  => %w{ Jamaica Bahamas Bermuda},
                          }
                }

#Voyage dates
def voyage_date
  start = (1..30).to_a.sample
  duration = [3, 7, 10, 14, 21].sample
  arrival = start + duration
  [Faker::Date.forward(days: start), duration, Faker::Date.forward(days: arrival)]
end

#price
def price (duration)
  if duration <= 10 then
    (200..220).to_a.sample * duration
  else
    (251..271).to_a.sample * duration
  end
end

#Cruise description
def description(duration)
  region = ["european", "caribbean"].sample
  if duration < 14 then
    ["#{duration} day Caribbean Cruise", region]
  else
    ["#{duration} day #{region.capitalize} Cruise", region]
  end  
end

#Inserting voyage data
(1..30).each do |i|
  start, duration, arrival = voyage_date
  price = price(duration)
  description, region = description(duration)

  Voyage.find_or_create_by!(
    description: description,
    departure_date: start,
    arrival_date: arrival,
    duration:duration,
    price:price
  )
end



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