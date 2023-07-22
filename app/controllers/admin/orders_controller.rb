class Admin::OrdersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])
    @order_items = @order.items
  end
  
  def update
     @order = Order.find(params[:id])
     @order.update(order_params)
     redirect_to admin_order_path(@order)
  end
end

 private
   def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
   end
   
   def order_params
       params.require(:order).permit(:postcode, :address, :receiver, :postage, :status)
   end
