class LineItem < ApplicationRecord
  belongs_to :candle
  belongs_to :cart
  belongs_to :order, optional: true
  has_many :images, through: :candle

  before_validation :set_unit_price

  def unit_price
    self[:unit_price] || candle.price
  end

  def total
    unit_price.to_f * quantity.to_i
  end

  private

  def set_unit_price
    self[:unit_price] ||= candle.price
  end
end
