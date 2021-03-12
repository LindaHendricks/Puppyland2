class Review < ApplicationRecord
  belongs_to :animal, :class_name => "Pet", :foreign_key => "pet_id"
  belongs_to :human, :class_name => "Renter", :foreign_key => "renter_id"


  validates :comment, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6 }

end


