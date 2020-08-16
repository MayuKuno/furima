class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :price, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :brand
      t.integer :condition, null: false
      t.integer :prefecture_id, null: false
      t.integer :preparationdays, null: false
      t.boolean :is_shipping_buyer, null: false
      t.references :saler_id
      t.references :buyer_id
      t.references :category, null: false
      t.timestamps
    end
  end
end