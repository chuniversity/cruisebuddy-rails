class ThingWithImage < ApplicationRecord
  has_one_attached :image
end
