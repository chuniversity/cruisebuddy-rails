def voyage_data (ships, region, duration, port)
  timefactor = 86400
  visited_ports = { 
    1 =>  {
      21 => %w{ Dover Lisbon Rome Sicily Venice Split Athens Crete Israel Alexandria },
      14 => %w{ Dover Lisbon Rome Sicily Venice Split Athens }
    },
    2 => {
      14 => %w{ Puerto\ Rico Jamaica Bahamas Bermuda Key\ West US\ Virgin\ Islands},
      10 => %w{ Puerto\ Rico Jamaica Bahamas Bermuda Virgin\ Islands},
    }, 
    3 => {
      7  => %w{ Puerto\ Rico Jamaica Bahamas Bermuda},
      3  => %w{ Jamaica Bahamas Bermuda},
    }
  }
  #ships is a range
  ships.each do |ship|
    #These variables are resetted for each ship
    today = Date.today.to_time.to_i
    start_time = 0
    end_time = 0
    next_deployment = 0
    departure_time = 0
    arrival_time = 0

    #Producing voyage data
    (1..10).each do |cruise_num| 

      #Calculating departure and arrival dates    
      days = duration.sample
      days_in_minutes = days * timefactor
      start_time = timefactor + next_deployment
      end_time =  start_time + days_in_minutes
      next_deployment = end_time + timefactor
      #Formatting dates
      departure_time = today + start_time
      arrival_time = today + end_time
      departure_date =  DateTime.strptime(departure_time.to_s, '%s').to_date.strftime("%B %d, %Y")
      arrival_date =  DateTime.strptime(arrival_time.to_s, '%s').to_date.strftime("%B %d, %Y")

      #port
      ports = visited_ports[region][days].join(', ')
      
      #description
      cruise_type = region == 1 ? "#{days} day European cruise" : "#{days} day Caribbean cruise"

      #price
      price = days <= 10 ? (200..220).to_a.sample * days : (251..271).to_a.sample * days
      Voyage.find_or_create_by!(
        description: cruise_type,
        departure_date: departure_date,
        arrival_date: arrival_date,
        duration: days,
        price: price,
        ports: ports,
        ship_id: ship,
        departure_port: port
      )
    end
  end
end
