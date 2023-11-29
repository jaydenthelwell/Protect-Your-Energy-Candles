class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :county
      t.string :postcode
      t.string :phone_number

      t.timestamps
    end
  end
end
