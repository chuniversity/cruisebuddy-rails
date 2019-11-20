class Port < ApplicationRecord
    has_many :voyage_port
    has_many :voyages, through: :voyage_port
    has_many :port_images
end
