# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# p User.find_or_create_by!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
require Rails.root.join('db/seeds_lib', 'cruiselines_data.rb')
require Rails.root.join('db/seeds_lib', 'ships_data.rb')
require Rails.root.join('db/seeds_lib', 'ports_data.rb')
require Rails.root.join('db/seeds_lib', 'reviews_data.rb')
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
user_profile = UserProfile.find_or_create_by!(user: user, ex_email: user.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username)

#creating additional users
(2..10).each do |i|
  email = "example#{i}@mail.com"
  user = User.create!(email: email , password: '123123123' , password_confirmation: '123123123')
  UserProfile.find_or_create_by!(user: user, ex_email: user.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.username)
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
=======
ShipImage.create(id: 1, url: 'http://chunis.org/images/ships/horizon1.jpg', ship_id: 1)
ShipImage.create(id: 2, url: 'http://chunis.org/images/ships/horizon2.jpg', ship_id: 1)
ShipImage.create(id: 3, url: 'http://chunis.org/images/ships/horizon3.jpg', ship_id: 1)
ShipImage.create(id: 4, url: 'http://chunis.org/images/ships/horizon4.jpg', ship_id: 1)
ShipImage.create(id: 5, url: 'http://chunis.org/images/ships/horizon5.jpg', ship_id: 1)
ShipImage.create(id: 6, url: 'http://chunis.org/images/ships/horizon6.jpg', ship_id: 1)
ShipImage.create(id: 7, url: 'http://chunis.org/images/ships/horizon7.jpg', ship_id: 1)
ShipImage.create(id: 8, url: 'http://chunis.org/images/ships/horizon8.jpg', ship_id: 1)
ShipImage.create(id: 9, url: 'http://chunis.org/images/ships/horizon9.jpg', ship_id: 1)
ShipImage.create(id: 10, url: 'http://chunis.org/images/ships/horizon10.jpg', ship_id: 1)




#list of ports
regions = {departing_ports: %w{ Miami },
           europe:  %w{ London Lisbon Rome Sicily Venice Split Athens Crete Israel Alexandria },
           caribbean: %w{ Puerto\ Rico Jamaica Bahamas Bermuda Key\ West US\ Virgin\ Islands},
}


  ports.each do |port|
    Port.find_or_create_by!(port_name: port)
  end
end 

#Voyage dates
voyage_data((1..5),2,[10,14],'Miami') # for Carnival Cruise
voyage_data((6..11),1,[14,21],'Dover') # for Royal Caribbean
voyage_data((15..15),3,[3,7],'Miami') # for Disney

#Reviews
REVIEWS.each do |element|
  Review.find_or_create_by!(
    body: element[:body],
    rating: element[:rating],
    user_profile_id: element[:user_profile_id],
    ship_id: element[:ship_id]
  )
end
=======
# def voyage_date
#   start = (1..30).to_a.sample
#   duration = [3, 7, 10, 14, 21].sample
#   arrival = start + duration
#   [Faker::Date.forward(days: start), duration, Faker::Date.forward(days: arrival)]
# end

# #price
# def price (duration)
#   if duration <= 10 then
#     (200..220).to_a.sample * duration
#   else
#     (251..271).to_a.sample * duration
#   end
# end



# #Cruise description
# def description(duration)
#   region = ["european", "caribbean"].sample
#   if duration < 14 then
#     ["#{duration} day Caribbean Cruise", region]
#   else
#     ["#{duration} day #{region.capitalize} Cruise", region]
#   end  
# end

# #Inserting voyage data
# (1..30).each do |i|
#   start, duration, arrival = voyage_date
#   price = price(duration)
#   description, region = description(duration)

#   Voyage.find_or_create_by!(
#     description: description,
#     departure_date: start,
#     arrival_date: arrival,
#     duration:duration,
#     price:price
#   )
# end

#Reviews

# Review.create(body: "I’ve never sailed carnival and I was pleasantly surprised at how large the ship was the food was amazing in fact I gained 4 pounds the crew really went over and above on every aspect of every part of the ship. The only reason for the four stars instead of the five was because the ship was overcrowded and I feel like the crew could’ve helped with crowd control at the pool or in the atrium Because the people were rude and wouldn’t get out of your way when you were trying to walk down to a hall and they walked very slow and did not care and weren’t very friendly. I can’t base this review on the actual cruise line it was just the luck of the draw for what type of people who lacked manners and weren’t polite. Cookie our cruise director was more than amazing and deserves 20 stars the dining room staff deserves 20 stars and I especially loved Adrian he was our head waiter and he really made us feel special every single night and you can tell he took pride in his work. So my only complaint was the was the people that were on the ship with us I just feelLike we were stuck with a rude crowd.", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(rating: 5, user_profile_id: 4, ship_id: 1, body: "We chose this ship because of the Havana Suites and what it had to offer. Im not sure why so many people didnt like the new elevators, we found them them to be great and easy to use. Our Havana suite was wonderful, steward was ok but not fantastic as we had hoped. The food was very good and plenty of options, so not sure why some reviews were so negative. Cookie, the cruise director was wonderful , he was so much fun in everything he did. Our next cruise will be on the Glory as that is where Cookie will be next. All in all we had a wonderful trip and are looking forward to our next one. We have cruised Carnival the most and have tried Royal Carib. ( beautiful ship but too big for us) and NCL ( run down ship and a different type of cruiser than we are used to) , We always go back to Carnival. Please take the negative reviews with a grain of salt, we all have different opinions and the trip will be what you make of it .. ENJOY !!!",)
# Review.create(rating: 4, user_profile_id: 6, ship_id: 1, body: "I provided a review for Carnival Breeze a year ago and this being a bit larger ship, we decided to cruise the Horizon. We arrived in the Port of Miami at 1040, expecting to wait until 1230 to check in. That was not the case. It appears that each port has its own way of doing things. We were rushed thru the process and was aboard at 1110. I cant complain about that. Tampa made you sit and wait until your time was called. So nicely done. Once onboard, you have to wait until 1 30 to get to your room, which is expected. Most Carnival cruisers know to go to the Lido and grab lunch usually at Guy's burgers or inside at the buffet. It was very busy to say the least. Food was good at Guy's burgers. Once in our room the room was clean and neat. We met our room steward within 10 minutes. My requests we simple, we prefer morning room cleaning and ice. Which we received every day. The water I ordered was there as well. The crew on our deck was very good.",)
# Review.create(body: "We chose this cruise for new ports we hadn’t visited, specific duration, and to experience a newer/large Carnival ship. I traveled with my 3 kids (18,13,11), and with a total group of 17. We stayed in 6235 which is aft and near the liquid lounge and IMAX theater.", rating: 4, user_profile_id: 2, ship_id: 2,)
# Review.create(body: "This was our first Journey's cruise. We did not know what to expect. Out of 3800 Passengers, 1800 were Platinum and about 100 were diamond. This means you will wait if you aren't diamond or platinum. If I had to do it over, I would have waited to become platinum before doing this cruise. The ship is awesome but I will now add cough syrup to the list. Many got an upper respiratory virus on this cruise which is not Carnival's fault; however, they could have done a better job cleaning. I noticed the Breeze did not have as many alcohol gel stations as other ships. The bathrooms often have 4 stalls and only one dryer which means people will NOT wash their hands. I hope they get this figured out. Layout was the typical 'Dream' Class ship. I did notice there were not as many stewards cleaning the common areas. Our waiters in the main dining room were amazing. Esumitra, Zara, and Joaquim made us feel like we were the only ones dining. You really get to know someone when you sail for 14 days. Millicent at the coffee bar was absolutely awesome.", rating: 4, user_profile_id: 1, ship_id: 3,)
# Review.create(body: "This was my sixth cruise- first one with Carnival, the others were on Royal Caribbean. My boyfriend and I (we are 24, almost 25) arrived in Fort Lauderdale a day before the cruise departed (we had to fly from New Jersey). Hotel in Fort Lauderdale: The Tranqulio Pros: affordable, uber ride away from the airport and cruise port, walking distance to the downtown area and the beach, friendly staff Cons: room was small and felt more like an Air BnB, no phone in the room to call down to the front desk, body wash and shampoo are all in one (no separate conditioner), have to turn in your room key or you’ll get charged $25", rating: 3, user_profile_id: 1, ship_id: 4,)
# Review.create(body: "This 5 night cruise from Galveston exceeded my expectations. A prior Carnival cruise was not great so I was apprehensive about this one. What a waste of worry! Plentiful waiters for fast soda package service.  Was concerned about room only being cleaned once a day, but we never ran out of towels (my biggest concern), and on the one day when we had all been in the sand and beach water, I requested towel replacement a bonus time and it was quickly provided.  The food was good! Blue Iguana is my new fav. Did not go to the dining room or specialty spots. Very long lines at lunch buffet though. Breakfast room service was free and prompt with lots of food options.  Bingo was fun and not rushed.", rating: 4, user_profile_id: 1, ship_id: 5,)
# Review.create(body: "I picked this cruise for the date and the itinerary. The price was great. We spent the day before looking around San Juan and loved Old San Juan. This was a special trip with my 2 teenage daughters. Last year I took my younger daughter on our first cruise. Getting my other girl to go with us was a joy. After hearing all about our cruise she was excited to join us this time. Freedom didn't disappoint. Our first site of that huge ship was awesome. Our arrival at the port could not have gone quicker. We were on board by 1 pm and started looking around all the decks. Lunch in Windjammer and drinks by the pool. Our room was a 6th deck balcony and was ready by 3 pm. It was great. Things might be worn but it was all good. We thought it was the room of our dreams. Our room attendant was Winsome from Jamaica? And she was a daily gift. I could not have asked for more. Dining in the main dining room was a fun, elegant time for us. We had great diner mates from Dallas and Columbus. The only meal we did not love was the lasagna. The staff all seemed to enjoy helping us have fun.", rating: 4, user_profile_id: 1, ship_id: 6,)
# Review.create(body: "We were a group of 4 friends who flew over from the UK to sail on the Liberty departing on the 10th November from Galveston, looking for some winter warmth and sunshine and a lot of fun. My partner and I had sailed with RC before, however for our friends, who have sailed on other cruise lines before, this was the first time on RC.  What has prompted me to write this review is the OUTSTANDING service we had on this ship. As written in other reviews, yes the ship is older than the newer generation ships and parts of it are looking dated, however it was kept immaculately clean, it is a well designed and easy to navigate ship and the entertainment and activities on offer are numerous and generally very good. Food in the buffet and main dining room was excellent and the drinks served were absolutely fine. No problem at all getting a sun lounger even on sea days, great pools, well equipped gym and the waterslides were great - we really loved the tidal wave!", rating: 4, user_profile_id: 1, ship_id: 7,)
# Review.create(body: "We went on the Symphony of the Seas with my husband and two friends and we had a wonderful week. We have sailed with Royal about 15 times and have most of the larger ships but first time on the Symphony. We choose an inside cabin because we knew that we were never going to be in the room. Embarkation was very easy with the We enjoyed two of the specialty restaurants, Chops and Jaime's Italian. We had anytime dining but had reservations and were able to get our same table every night that we are in the main dining room. Lourdes and Sonny were incredible. We did not have enough time to do everything and could have stayed on the ship for another week. Even though there were over 5000 people on board the only time it ever felt crowded was the first day at the windjammer buffet and a few times at dinner when you are waiting in line. Make sure you reserve your shows and dinner times on line and you will not have a problem. My favorite show was the comedy and the ice show but all the entertainment was great. The port were not great but you do not even need to get off the ship.I can't wait to go on this ship again.", rating: 5, user_profile_id: 1, ship_id: 8,)
# Review.create(body: "From a very speedy embarkation through to the just as speedy disembarkation the week was great. We never had a bad meal and our very picky teenager always found something to eat. We did my time dining and the food and service was excellent. Plenty to do on board for the kids as well as the adults. The ship never felt overcrowded even when we had a day of rain, so many places for people to disperse to. Never had a problem getting a bed round the pool and the shop was at capacity.", rating: 5, user_profile_id: 1, ship_id: 9,)
# Review.create(body: "This was our first Royal Caribbean cruise and we were attracted by both the opportunity to be on one of the largest ships at sea and by the . Before booking and then for almost every day before sailing we researched the ship, looked at other reviews and spoke with the travel agent about what to expect. We were concerned about a number of reviews that referenced a tired ship and about Royal Caribbean's reported practice of 'nickel and diming' guests to extort as much additional money as possible. I absolutely have to address these issues because they are absolutely not our experience. The ship is overwhelmingly big but it is in beautiful order. Yes there is some upgrade necessary. If you are the type of guest who will obsess about handrails that have been bleached by the sun and are in need of sanding and re-varnishing then look elsewhere because your holiday may be ruined! Otherwise, have no fears - it's spotlessly clean, the staff are friendly and attentive and there is much to do. Not once were we approached about upgrades or trips, nor were we pushed for additional tipping or anything else.", rating: 4, user_profile_id: 1, ship_id: 10,)
# Review.create(body: "'ve been on a lot of cruise with different cruise lines but this is the best, so far. Was on the ship eating lunch at 11:00 even though cabins weren't ready till 1:00. Ship is enormous with over 5500 passengers but it didn't seem crowded. We had a balcony cabin that was ocean view. Crew was very friendly. No issues with any member. Only saw the cruise director 1 time and that was at an evening show. Entertainment was very good..", rating: 4, user_profile_id: 1, ship_id: 11,)
# Review.create(body: "Our very first time on a cruise. We were family of 6, adjoining rooms with daughter, son in law , 4 yr old and 6 yr old. Rooms were immaculate and the veranda views were beautiful. Disney app made scheduling character sessions, shows, activities and messaging between family members easy and convenient. Food at cabanas was very good and varied. Shows were fantastic and magical for both the children and adults. Kids enjoyed the kids club and attended 3 out of 5 days for 2 hours each day which was a little nice break for both them and the adults. Prices at clubs for drinks and food were comparable to city eateries. Kids were able to see each character because we kept an eye on timing and made sure we were early for each activity plus set alerts on the app which were very useful and we took our own pictures , no need for photo package. Since it was a repositioning cruise our port stop was Antigua, took a brief walk to see some local sites, church and people then headed early back to ship for some pool/slide time in a calmer atmosphere.", rating: 4, user_profile_id: 1, ship_id: 12,)
# Review.create(body: "No one does it better than Disney! After the terrible experience of taking my first cruise on Carnival about 5 years ago I was real hesitant to go cruising again...least to say I'm very glad I gave Disney a try because they changed my perspective on the whole cruising industry. Our cruise was a 7 night to the Mexican Rivera with stops in Cabo, Mazatlan and Puerto Vallarta. The room was great! We had a family balcony stateroom which was very spacious and could sleep up to 5 people with 4 beds in the room. The split bathrooms on Disney ships are genius, especially for getting ready in the mornings. Our room steward Lorenzo was amazing!", rating: 4, user_profile_id: 1, ship_id: 13,)
# Review.create(body: "I chose Disney because of the rave reviews that I had researched and heard about from friends and acquaintances. In general, my family and I had a great time. The services and staff were great and very accommodating when things didn’t work as expected like trying to dial ship to shore from my stateroom. The ship is impeccably well maintained and clean and there is plenty for passengers of all ages to do during the voyage. My only criticism is that while the food was good, some of the dishes could have been served hotter than they were. I realize they are serving the masses, but the hot entrees should not arrive cool or cold to passengers. If the time duration from the stove top to the passenger was reduced, I think I would rate the food as great to outstanding. Nevertheless, I would not hesitate to travel again with Disney and hope to do so very soon.", rating: 4, user_profile_id: 1, ship_id: 14,)
# Review.create(body: "We chose this cruise because our 3 year old grand-daughter is obsessed with Disney. Our Grand-daughter enjoyed this cruise and overall I thought it was a good solid cruise experience. However, I did not feel it was a good value for the money and overall it was just ok. For what I paid for this cruise, it should have been extraordinary and it just wasn't. We were on the eight day Halloween on the High Seas cruise. I'll try to lay out each aspect and describe what I thought was good and bad. We are frequent cruisers, primarily on RCCL, but have cruise most of the other lines as well.", rating: 4, user_profile_id: 1, ship_id: 15,)
# Review.create(id: 16, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 17, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 18, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 19, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 20, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 21, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 22, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 23, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 24, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 25, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 26, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 27, body: "", rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 28, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 29, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 30, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 31, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 32, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 33, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 34, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 35, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 36, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 37, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 38, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 39, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 40, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 41, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 42, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 43, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 44, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 45, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 46, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 47, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 48, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 49, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 50, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 51, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 52, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 53, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 54, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 55, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 56, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 57, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 58, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 59, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 60, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 61, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 62, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 63, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 64, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 65, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 66, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 67, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 68, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 69, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 70, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 71, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 72, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 73, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 74, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)
# Review.create(id: 75, body: '', rating: 4, user_profile_id: 1, ship_id: 1,)

## Comments 


Comment.create(body: "How crowded was it? All Carnival Cruises tend to be crowded. lol", user_profile_id: 2, review_id: 1,)
Comment.create(body: "No, this one was more than I've seen it, possibly because it was the beginning of summer", user_profile_id: 1, review_id: 1,)
Comment.create(body: "How big are the rooms?", user_profile_id: 3, review_id: 1,)
Comment.create(body: "I'm going on the Horizon next month. Sounds like fun!", user_profile_id: 4, review_id: 1,)
Comment.create(user_profile_id: 7, review_id: 2, body: "I agree about Carnival. Hope you had a great time.",) 
Comment.create(user_profile_id: 8, review_id: 2, body: "What are the Havana Suites? Is this a cuba cruise?",) 
Comment.create(user_profile_id: 9, review_id: 3, body: "How is the Horizon compared to the breeze?",) 


#Reviews 2

# (2..100).each do |i|
#   Review.find_or_create_by!(
#     body: Faker::Lorem.paragraph(sentence_count: 10),
#     rating: (1..5).to_a.sample,
#     user_profile_id: (1..10).to_a.sample,
#     ship_id: (1..15).to_a.sample
#   )
# end

puts "PASSED"