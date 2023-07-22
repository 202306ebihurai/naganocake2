class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8) #商品を8件取得
    @items_all = Item.all
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @item_price_with_tax = @item.with_tax_price
    @cart_item = CartItem.new
    @genre = Genre.all
  end

  def search
    @items = Item.where("name LIKE ?", "%#{params[:word]}%")
    @genre = Genre.all
    render "search"
  end
end
