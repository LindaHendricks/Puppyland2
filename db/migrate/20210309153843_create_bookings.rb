class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :location
      t.string :date
      t.belongs_to :pet, null: false, foreign_key: true
      t.belongs_to :renter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
