class RemoveDuplicateOrderIdFromLineItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :line_items, :order_id
  end
end
