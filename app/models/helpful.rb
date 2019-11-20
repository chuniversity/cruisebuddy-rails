class Helpful < ApplicationRecord
  belongs_to :user_profile
  belongs_to :review
end
