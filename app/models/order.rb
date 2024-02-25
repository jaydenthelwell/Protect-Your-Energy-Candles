class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :candles, through: :line_items

  enum status: {
    pending: 0,
    paid: 1
  }
  def total_amount
    line_items.sum(&:total)
  end

end
