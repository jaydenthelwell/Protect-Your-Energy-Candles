class AddOrderReferenceToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_items, :order, null: true, foreign_key: true
  end
end
