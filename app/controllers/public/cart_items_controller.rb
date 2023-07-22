class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
    @cart_total_amount = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "数量が更新されました。"
    else
      redirect_to cart_items_path, alert: "数量の更新に失敗しました。"
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

    if @cart_item.present?  #カート内に商品が存在するとき
      @cart_item.quantity += cart_item_params[:quantity].to_i  #数量を追加
      if @cart_item.save
        flash[:notice] = "カート内の商品を更新しました。"
        redirect_to cart_items_path
      else
        redirect_to request.referer
      end
    else  #カート内に商品が存在しないとき
      @cart_item = current_customer.cart_items.build(cart_item_params)
      if @cart_item.valid? # 保存前に@cart_itemが有効であるかをチェック
        if @cart_item.save
          flash[:notice] = "カートに商品を追加しました。"
          redirect_to cart_items_path
        else
          redirect_to request.referer
        end
      else  #showビューを再描画
        @item = Item.find(cart_item_params[:item_id])
        @item_price_with_tax = @item.with_tax_price
        @genre = Genre.all
        flash[:alert] = "数量を選択してください。"
        render 'public/items/show'
      end
    end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
