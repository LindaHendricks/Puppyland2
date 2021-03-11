class Renter < ApplicationRecord
    has_many :bookings
    has_many :pets, through: :bookings

    has_many :reviews
    has_many :animals, through: :reviews

    has_secure_password

    #validates :username, presence: true,   uniqueness: true
end
