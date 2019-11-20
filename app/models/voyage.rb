class Voyage < ApplicationRecord
  belongs_to :region
  has_many :voyage_port
  has_many :ports, through: :voyage_port
end
