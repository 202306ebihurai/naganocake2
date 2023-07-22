class Admin::OrdersController < ApplicationController

  def show
     @customer = Customer.find(params[:id])
     @order = Order.find(params[:id])
     @item = Item.find(params[:id])
     @order_items = @order.order_details.all #注文ごとに紐づいた商品の表示
     @order_details = @order.order_details.all
     @total_item_amount = @order_details.sum { |order_detail| order_detail.subtotal }
     @order = Order.find(params[:id])
     
  end

  def update　#注文ステータスの更新
     @order = Order.find(params[:id])
     @order.update(order_params)
     redirect_to admin_order_path(@order)
  end
  

 private
 
   def order_params
       params.require(:order).permit(:status)
   end

end

 