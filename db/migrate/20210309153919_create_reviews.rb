class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating
      t.date :date
      t.belongs_to :pet, null: false, foreign_key: true
      t.belongs_to :renter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
