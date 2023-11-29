# Example: db/migrate/YYYYMMDDHHMMSS_create_carts.rb
class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
