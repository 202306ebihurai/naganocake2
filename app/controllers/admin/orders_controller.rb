class Admin::OrdersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
  end
  
  def update
  end
end

 private
   def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
   end
