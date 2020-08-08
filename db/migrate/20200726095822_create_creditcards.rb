class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.references :user,              null: false, foreign_key: true
      # t.integer :customer_id,              null: false, default: ""
      t.string :card_id, null: false    
      t.timestamps
    end
  end
end
