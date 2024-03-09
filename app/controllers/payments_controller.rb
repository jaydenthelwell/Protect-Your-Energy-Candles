class PaymentsController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(
      session_id: session.id.to_s,
      stripe_checkout_id: params[:session_id]
    )
    stripe_session = Stripe::Checkout::Session.retrieve(params[:session_id])

    if stripe_session.status == "complete"
      @order.paid!
      puts "Order marked as paid!"

    else
      @order.pending!
      puts "Order marked as pending!"
    end

    @line_items.each do |line_item|
      line_item.order = @order
      line_item.save
    end
  end
end
