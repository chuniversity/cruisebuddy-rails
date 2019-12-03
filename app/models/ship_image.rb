class ShipImage < ApplicationRecord
  belongs_to :ship
  belongs_to :review, optional: true
  has_one_attached :image
end
