class Edition < ApplicationRecord
  has_many :candles
  validates :name, presence: true

  CANDLE_SHOP_NAME = 'Candle Shop'.freeze

  def self.candle_shop
    find_or_create_by(name: CANDLE_SHOP_NAME)
  end

  ESSENTIALS_NAME = 'Essentials'.freeze

  def self.essentials
    find_or_create_by(name: ESSENTIALS_NAME)
  end
end
