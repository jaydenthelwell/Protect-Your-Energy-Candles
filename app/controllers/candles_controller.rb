class CandlesController < ApplicationController
  def index
    @candles = Candle.all
    render 'index'
  end

  def show
    @candle = Candle.find(params[:id])
    @candles = Candle.all
  end
end
