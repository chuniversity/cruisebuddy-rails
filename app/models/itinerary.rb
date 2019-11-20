class Itinerary < ApplicationRecord
  belongs_to :ship
  belongs_to :voyage_port
end
