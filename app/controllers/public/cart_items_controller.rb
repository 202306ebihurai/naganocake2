class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_total_amount = @cart_items.sum { |cart_item| cart_item.subtotal }
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    # byebug
    @cart_item = current_customer.cart_items.build(cart_item_params)
    # byebug
    @cart_item.save!
    # byebug
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
