class Review < ApplicationRecord
  belongs_to :animal, :class_name => "Pet", :foreign_key => "pet_id"
  belongs_to :human, :class_name => "Renter", :foreign_key => "renter_id"
end


