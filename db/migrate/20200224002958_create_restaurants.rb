class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :contact
      t.string :email
      t.string :website
      t.text :address
      t.integer :price
      t.string :cuisine
      t.integer :eatout
      t.integer :eatin
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
