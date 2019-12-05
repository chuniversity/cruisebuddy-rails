# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# p User.find_or_create_by!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
require Rails.root.join('db/seeds_lib', 'cruiselines_data.rb')
require Rails.root.join('db/seeds_lib', 'ships_data.rb')
require Rails.root.join('db/seeds_lib', 'ports_data.rb')
require Rails.root.join('db/seeds_lib', 'reviews_data.rb')
require Rails.root.join('db/seeds_lib', 'voyage_record_generation.rb')
require Rails.root.join('db/seeds_lib', 'user_data.rb')
require Rails.root.join('db/seeds_lib', 'ships_images.rb')
USER_DATA.each do |datum|
  last_name = Faker::Name.last_name
  user = User.create!(
    email: datum[:email], 
    password: datum[:password], 
    password_confirmation: datum[:password_confirmation])
  UserProfile.find_or_create_by!(
    user: user, 
    ex_email: user.email, 
    first_name: datum[:first_name], 
    last_name: last_name, 
    username: datum[:first_name] + last_name + '01',
    url: datum[:picture_url]
    )
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
voyage_data((12..15),3,[3,7],'Miami') # for Disney
#Reviews
REVIEWS.each do |element|
  Review.find_or_create_by!(
    body: element[:body],
    rating: element[:rating],
    user_profile_id: element[:user_profile_id],
    ship_id: element[:ship_id]
  )
end
#Ship images
image_generation()
#Comments
Comment.create(
              body: "How crowded was it? All Carnival Cruises tend to be crowded. lol", 
              user_profile_id: 2, 
              review_id: 1,)
Comment.create(
              body: "No, this one was more than I've seen it, possibly because it was the beginning of summer", user_profile_id: 1, 
              review_id: 2,)
Comment.create(
              body: "How big are the rooms?", 
              user_profile_id: 3, 
              review_id: 3,)
Comment.create(
              body: "I'm going on the Horizon next month. Sounds like fun!",  
              user_profile_id: 4, 
              review_id: 1,)
Comment.create(
              body: "I agree about Carnival. Hope you had a great time.",
              user_profile_id: 7,   
              review_id: 2) 
Comment.create(
              body: "What are the Havana Suites? Is this a cuba cruise?",
              user_profile_id: 8,   
              review_id: 3) 
Comment.create(
              body: "How is the Horizon compared to the breeze?",
              user_profile_id: 9, 
              review_id: 4) 

puts "PASSED"