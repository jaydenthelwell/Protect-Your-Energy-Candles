class Candle < ApplicationRecord
  validates :scent, :size, :date_made, :description, presence: true
  validates :stock, :price, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :edition
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :images, dependent: :destroy

  validates :images, length: { is: 3 }

  # monetize :price_pounds, as: "price", with_currency: :gbp, numericality: { greater_than_or_equal_to: 0 }, :allow_nil => true
end
