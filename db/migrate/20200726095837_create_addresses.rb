class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postcode,              null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.text :street, null: false
      t.text :building
      t.string :phone_number,       null: false, unique:true
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end

# 【あとで調べること】
# null: false
# unique:true
# add_index