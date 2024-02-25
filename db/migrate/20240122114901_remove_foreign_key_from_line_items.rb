class RemoveForeignKeyFromLineItems < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :line_items, :carts
  end
end
