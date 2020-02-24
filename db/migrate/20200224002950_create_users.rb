class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.text :address
      t.text :password_digest

      t.timestamps
    end
  end
end
