class HomeController < ApplicationController
  def index
    @candles = Candle.all
  end
end
