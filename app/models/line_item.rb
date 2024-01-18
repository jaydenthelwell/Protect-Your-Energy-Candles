class LineItem < ApplicationRecord
  belongs_to :candle
  belongs_to :cart
  has_many :images, through: :candle

  def unit_price
    if persisted?
      self[:unit_price]
    else
      candle.price
    end
  end

  def total
    return unit_price.to_f * quantity.to_i
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total
  end
end
