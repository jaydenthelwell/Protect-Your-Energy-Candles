class EditionsController < ApplicationController
  def light
    @candles = Candle.where(edition: Edition.light_edition)
    render 'light'
  end
  def dark
    @candles = Candle.where(edition: Edition.dark_edition)
    render 'dark'
  end
end
