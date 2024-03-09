class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users_orders = current_user.orders
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

  def create
    @order = current_user.orders.build(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:session_id, :stripe_checkout_id, :status)
  end
end
