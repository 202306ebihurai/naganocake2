class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @addresses = current_customer.addresses.all
    @cart_items = current_customer.cart_items.all
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    @total_item_amount = 0
    current_customer.cart_items.each do |cart_item|
      @total_item_amount += cart_item.subtotal
    end
    @order.total_amount = @order.postage + @total_item_amount

    @order.save!

    current_customer.cart_items.each do |cart_item|
      @ordered_item = OrderDetail.new
      @ordered_item.order_id = @order.id
      @ordered_item.item_id = cart_item.item_id
      @ordered_item.quantity = cart_item.quantity
      @ordered_item.add_tax_price = cart_item.item.with_tax_price
      @ordered_item.save
    end

    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total_item_amount = @order_details.sum { |order_detail| order_detail.subtotal }
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :address_type, :address_id, :postcode, :address, :address_name, :order_address, :receiver, :customer_id, :postage, :total_amount, :status)
  end

end
