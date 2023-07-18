class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_total_amount = 0
  end

  def update
  @cart_item = CartItem.find(params[:id])
  if @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: "数量が更新されました。"
  else
    redirect_to cart_items_path, notice: "数量の更新に失敗しました。"
  end
end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

def create
  @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])

  if @cart_item.present?
    @cart_item.quantity += cart_item_params[:quantity].to_i
    if @cart_item.save
      redirect_to cart_items_path, notice: "カート内の商品を更新しました。"
    else
      redirect_to cart_items_path, alert: "カート内の商品の更新に失敗しました。"
    end
  else
    @cart_item = current_customer.cart_items.build(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path, notice: "カートに商品を追加しました。"
    else
      redirect_to cart_items_path, alert: "カートへの商品追加に失敗しました。"
    end
  end
end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
