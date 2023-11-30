class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
  before_action :set_line_items

  private

  def set_line_items
    if session[:cart_id]
      @line_items = Cart.find(session[:cart_id]).line_items
    else
      @line_items = []
    end
  end
end
