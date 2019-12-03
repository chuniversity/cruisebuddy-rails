class Review < ApplicationRecord
  belongs_to :user_profile
  belongs_to :ship
  has_many :comments
  has_many :helpfuls
  has_one :ship_image
end
