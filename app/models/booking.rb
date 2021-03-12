class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :renter

  # validates :date, presence: { message: "must be given please" }
  validates :location, presence: { message: "must be given please" }
  
  def date_location
    "Booking date is #{date}, it will take place in #{location}"
  end 
end
