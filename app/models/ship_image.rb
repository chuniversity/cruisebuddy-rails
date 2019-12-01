class ShipImage < ApplicationRecord
  belongs_to :ship
  has_one_attached :image
end
