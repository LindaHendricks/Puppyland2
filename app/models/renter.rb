class Renter < ApplicationRecord
    has_many :bookings
    has_many :pets, through: :bookings

    has_many :reviews
    has_many :animals, through: :reviews

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :name, presence: true
    validates :age, presence: true, numericality: true
    validates :phone_number, presence: true
    validates :address, presence: true
    validates :password, presence: true
end
