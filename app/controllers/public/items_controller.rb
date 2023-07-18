class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
  end

  def show
    @items = Item.find(params[:id])
    @item_price_with_tax = @items.price_with_tax
  end
end
