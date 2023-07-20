class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @addresses = current_customer.addresses.all
    @cart_items = current_customer.cart_items.all
    @order = Order.new
    @order.postage = 800

    @total_item_amount = 0
    @cart_items.each do |cart_item|
      @total_item_amount += cart_item.subtotal
    end

    @total_order_amount = @order.postage + @total_item_amount

    if params[:order][:address_type] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.receiver = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif  params[:order][:address_type] == "1"
      receiver = Address.find(params[:order][:order_address])
      @order.postcode = receiver.postcode
      @order.address = receiver.address
      @order.receiver = receiver.receiver
      render 'confirm'
    elsif  params[:order][:address_type] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.receiver = params[:order][:address_name]
      render 'confirm'
    else
      render 'new'
    end

  end

  def thanks
  end

  def create
    @order = Order.new

  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :address_type, :address_id, :postcode, :address, :address_name, :order_address)
  end

end
