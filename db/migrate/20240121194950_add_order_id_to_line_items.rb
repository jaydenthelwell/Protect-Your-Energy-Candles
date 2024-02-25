class AddOrderIdToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :order_id, :integer
  end
end
