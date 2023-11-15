class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.date :d_o_b
      t.string :phone_number
      t.text :address
      t.string :email
      t.string :password_digest
      t.string :credit_card_number
      t.integer :rolex

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :credit_card_number
  end
end
