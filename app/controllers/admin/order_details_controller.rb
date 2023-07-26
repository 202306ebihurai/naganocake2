class Admin::OrderDetailsController < ApplicationController

  def update #制作ステータスの更新
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    @order_detail.update(order_detail_params)
    
   # redirect_to admin_order_path(@order_detail.order)
    is_updated = true
    if @order_detail.update(order_detail_params)
       @order.update(status: 2) if @order_detail.making_status == "in_production"
       @order_details.each do |order_detail| 
        if order_detail.making_status != "production_complete" # 製作ステータスが「製作完了」ではない場合 
          is_updated = false # 上記で定義してあるis_updatedを「false」に変更する。
        end
      end
      @order.update(status: 3) if is_updated
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
    end
    redirect_to admin_order_path(@order)
    
    
  end


  private
    def order_detail_params
         params.require(:order_detail).permit(:making_status)
    end

end






