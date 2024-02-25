class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def empty_cart
    line_items.each do |line_item|
      line_item.update(cart: nil)
    end
    line_items.reload
  end

  def add_candle(candle)
    current_item = line_items.find_by(candle_id: candle.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(candle_id: candle.id)
    end
    current_item
  end
end
