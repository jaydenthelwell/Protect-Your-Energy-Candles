class HomeController < ApplicationController
  def index
    @candles_candle_shop = Candle.where(edition: Edition.candle_shop)
    @candles_essentials = Candle.where(edition: Edition.essentials)
  end
end
