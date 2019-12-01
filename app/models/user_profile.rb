class UserProfile < ApplicationRecord
    has_many :reviews
    has_many :comments
    has_many :helpfuls
    belongs_to :user
end
