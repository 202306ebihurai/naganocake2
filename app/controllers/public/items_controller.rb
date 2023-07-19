class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8) #商品を8件取得
    @items_all = Item.all
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @item_price_with_tax = @item.with_tax_price
  end
end
