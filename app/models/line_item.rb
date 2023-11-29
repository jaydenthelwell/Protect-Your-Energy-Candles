class LineItem < ApplicationRecord
  belongs_to :candle
  belongs_to :cart
end
