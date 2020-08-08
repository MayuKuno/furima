class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :first_name,              null: false
      t.string :last_name,              null: false
      t.string :first_name_kana,              null: false
      t.string :last_name_kana,              null: false
      t.integer :postcode,              null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.text :street, null: false
      t.text :building
      t.integer :phone_number
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
