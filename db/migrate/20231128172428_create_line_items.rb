class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.references :candle, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
# In your migration file
remove_foreign_key :line_items, :carts

      t.timestamps
    end
  end
end
# In your migration file
remove_foreign_key :line_items, :carts
