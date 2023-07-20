class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @addresses = current_customer.addresses.all
    @order = Order.new

    if params[:order][:address_type] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.receiver = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif  params[:order][:address_type] == "1"
      receiver = Address.find(params[:order][:order_address])
      @order.postcode = receiver.postcode
      @order.address = receiver.address
      @order.name = receiver.receiver
      render 'confirm'
    elsif  params[:order][:address_type] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:address_name]
      render 'confirm'
    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
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
    params.require(:order).permit(:payment_method, :address_type, :address_id, :postcode, :address, :address_name, :order_address)
  end

end
