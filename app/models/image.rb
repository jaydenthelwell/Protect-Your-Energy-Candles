class Image < ApplicationRecord
  belongs_to :candle
  validates :url, presence: true
end
