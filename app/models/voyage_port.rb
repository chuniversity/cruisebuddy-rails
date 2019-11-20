class VoyagePort < ApplicationRecord
  belongs_to :port
  belongs_to :voyage
  has_many :itineraries
end
