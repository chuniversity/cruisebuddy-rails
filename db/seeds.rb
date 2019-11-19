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

cruise_line = CruiseLine.find_or_create_by!(name: Faker::Lorem.words(number: 4).map{|w| w.capitalize}.join(' '))
p cruise_line
ship = Ship.find_or_create_by!(name: Faker::Lorem.word.capitalize, cruise_line: cruise_line)
p ship
p ShipImage.find_or_create_by!(url: SHIPIMAGE_URL, ship: ship)

review = Review.find_or_create_by!(user_profile: user_profile, ship: ship, body: Faker::Lorem.paragraph, rating: fake_rating )
p review
comment = Comment.create!(review: review, user_profile: user_profile, body:Faker::Lorem.sentence)
p comment
p Helpful.find_or_create_by!(review: review, user_profile: user_profile)

port = Port.find_or_create_by!(name: Faker::Lorem.word.capitalize)
p port

port_image = PortImage.find_or_create_by!(url: SHIPIMAGE_URL, port: port)
region = Region.find_or_create_by!(name: Faker::Address.country, description: Faker::Lorem.paragraph)
p region

start, end_ = fake_start_and_end
voyage = Voyage.find_or_create_by!(start: start, end: end_, region: region)
p voyage
puts "PASSED"
