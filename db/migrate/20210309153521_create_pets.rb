class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :description
      t.string :color
      t.belongs_to :breed, null: false, foreign_key: true
      t.string :picture
      t.string :location

      t.timestamps
    end
  end
end
