class CheckoutsController < ApplicationController
  def show
    @session = Stripe::Checkout::Session.create(
      line_items: [{
        price_data: {
          currency: "gbp",
          product_data: {
            name: candle.name
          },
          unit_amount: (candle.price * 100).to_i
        },
        quantity: 1
      }],
      mode: "payment",
      ui_mode: "embedded",
      return_url: CGI.unescape(payment_url(session_id: '{CHECKOUT_SESSION_ID}'))
    )
    puts "Session created: #{@session.inspect}"
    Order.create(session_id: session.id, stripe_checkout_id: @session.id)
  end

  private

  def candle
    @candle ||= Candle.find(params[:id])
  end
end
