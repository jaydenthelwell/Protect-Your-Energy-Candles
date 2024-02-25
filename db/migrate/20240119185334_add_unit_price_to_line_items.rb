class AddUnitPriceToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :unit_price, :decimal
  end
end
