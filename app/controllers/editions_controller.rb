class EditionsController < ApplicationController
  def candle_shop
    @candles = Candle.where(edition: Edition.candle_shop)
    render 'candle_shop'
  end
  def essentials
    @candles = Candle.where(edition: Edition.essentials)
    render 'essentials'
  end
end
