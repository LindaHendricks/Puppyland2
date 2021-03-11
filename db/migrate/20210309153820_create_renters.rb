class CreateRenters < ActiveRecord::Migration[6.1]
  def change
    create_table :renters do |t|
      t.string :password_digest
      t.string :username
      t.string :name
      t.string :address
      t.integer :age
      t.string :phone_number
      t.string :picture

      t.timestamps
    end
  end
end
