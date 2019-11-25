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
#p user
user_profile = UserProfile.find_or_create_by!(ex_email: user.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username)

#creating additional users
(2..10).each do |i|
  email = "example#{1}@mail.com"
  user = User.create!(email: email , password: '123123123' , password_confirmation: '123123123')
  UserProfile.find_or_create_by!(ex_email: user.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username)
end

#Cruise Line
cruiselines = ['Carnival', 'Royal Caribbean', 'Disney Cruise']

cruiselines.each do |cruiseline|
  CruiseLine.find_or_create_by!(name: cruiseline)
end

#Ships
ships_collection = {
        1 => {
              1 => {ship_name: 'Carnival Horizon', ship_url:  'https://www.carnival.com/~/media/Images/Ships/HZ/carnival-horizon/heros/carnival-horizon-standard-ship.jpg'
                   },
              2 => {ship_name: 'Carnival Vista', ship_url:  'https://upload.wikimedia.org/wikipedia/commons/b/bb/TRIESTE_NAVI_%2826741027796%29_%28cropped%29.jpg'
                   },
              3 => {ship_name: 'Carnival Breeze', ship_url: 'https://www.cruisehive.com/wp-content/uploads/2015/08/carnivalbreeze1small.jpg'
                   },
              4 => {ship_name: 'Carnival Magic', ship_url:  'https://i.imgur.com/lZJ4PxT.jpg'
                   },
              5 => {ship_name: 'Carnival Dream', ship_url:  'https://images.cruisecritic.com/image/5531/carnival-dream_600x300_21.jpg'
                   }               
              },
        2 => {
              6 => {ship_name: 'Freedom of the Seas', ship_url:  'https://live.staticflickr.com/2423/3934243662_7a5b0c50a8_b.jpg'
                   },
              7 => {ship_name: 'Liberty of the Seas', ship_url:  'https://d1xfoqsc632pe4.cloudfront.net/images/dyn/cc/429027094ab7ea4133e1f5.25409721-1254518315.jpg'
                   },
              8 => {ship_name: 'Symphony of the Seas', ship_url:  'https://clubthrifty.com/wp-content/uploads/2019/08/Symphony-of-the-Seas_Featured-Image.jpg'
                   },
              9 => {ship_name: 'Harmony of the Seas', ship_url:  'https://images.cruisecritic.com/image/5599/royal-caribbean-harmony-of-the-seas_600x300_21.jpg'
                   },
              10 => {ship_name: 'Oasis of the Seas', ship_url:  'https://d23n7ahjfnjotp.cloudfront.net/imgs/mobileheaderipad/ship_292_rci_oa_aerials_labadee-2-011f_1024x416_mobhdr.jpg'
                   },
              11 => {ship_name: 'Allure of the Seas', ship_url:  'https://images.cruisecritic.com/image/5556/royal-caribbean-allure-of-the-seas_600x300_21.jpg'
                   }                                       
              },
        3 => {
              12 => {ship_name: 'Disney Magic', ship_url:  'https://cdn1.parksmedia.wdprapps.disney.com/media/blog/wp-content/uploads/2018/08/wegfds47385-624x351.jpg'
                   },
              13 => {ship_name: 'Disney Wonder', ship_url:  'https://cdn1.parksmedia.wdprapps.disney.com/media/blog/wp-content/uploads/2016/11/ndwe4796785711.jpg'
                   },
              14 => {ship_name: 'Disney Dream', ship_url:  'https://www.picturethemagic.com/wp-content/uploads/2018/07/disney-dream-ship-castaway-cay-flickr.jpg'
                   },
              15 => {ship_name: 'Disney Fantasy', ship_url:  'http://www.disneyholidays.co.uk/disney-cruise-line/images/ships/mobile/disney-dream.jpg'
                   }                    
             }
}

ships_collection.each do |cruise_line_id, ships_ids|
  # cruise_line_id
  ships_ids.each do |ship_id, ship_data|
    # puts ship_id
    # puts ship_data[:ship_name]
    # puts ship_data[:ship_url]

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