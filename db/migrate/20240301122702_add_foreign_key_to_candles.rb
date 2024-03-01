class AddForeignKeyToCandles < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :candles, :editions
  end
end
