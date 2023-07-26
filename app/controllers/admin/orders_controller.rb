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

  def update #注文ステータスの更新
    @order = Order.find(params[:id])
    #@order_details = OrderDetail.where(order_id: params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(making_status: "制作待ち") if @order.status == "入金確認"
    end
      redirect_to admin_order_path(@order)
  end


 private

   def order_params
       params.require(:order).permit(:status)
   end

end

