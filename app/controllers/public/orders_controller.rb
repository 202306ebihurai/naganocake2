class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    # @order = Order.new(order_params)
    # redirect_to confirm_orders_path
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :address_type, :address_id)
  end

end
