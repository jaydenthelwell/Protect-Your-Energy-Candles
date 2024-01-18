class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
  before_action :set_line_items

  def light
    @candles = Candle.where(edition: Edition.light_edition)
    render 'light'
  end
  def dark
    @candles = Candle.where(edition: Edition.dark_edition)
    render 'dark'
  end

  private

  def set_line_items
    if session[:cart_id]
      @line_items = Cart.find(session[:cart_id]).line_items
    else
      @line_items = []
    end
  end
end
