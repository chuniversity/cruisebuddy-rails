class Ship < ApplicationRecord
  belongs_to :cruise_line
  has_many :ship_images
  has_many :reviews
  has_many :voyages
end
