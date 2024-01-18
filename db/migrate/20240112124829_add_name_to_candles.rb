class AddNameToCandles < ActiveRecord::Migration[6.0]
  def change
    add_column :candles, :name, :string
  end
end
