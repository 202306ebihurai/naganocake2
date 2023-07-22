class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(detail_params)
    redirect_to admin_order_path(@order)
  end
  
  
  private
    def detail_params
         params.require(:order_detail).permit(:order_id, :item_id, :add_tax_price, :quantity, :making_status)
    end
   
end






