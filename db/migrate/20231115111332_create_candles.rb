class CreateCandles < ActiveRecord::Migration[7.0]
  def change
    create_table :candles do |t|
      t.string :scent
      t.string :size
      t.date :date_made
      t.text :description
      t.integer :stock
      t.decimal :price
      t.references :edition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
