class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :house_name
      t.integer :rent_fee
      t.text :address
      t.integer :age
      t.text :note
      t.timestamps
    end
  end
end
