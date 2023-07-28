class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8) #商品を8件取得
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
    @genre = Genre.all

    if params[:word]
      @items = Item.where("name LIKE ?", "%#{params[:word]}%").page(params[:page]).per(8)
    elsif params[:genre_id]
      @genres = Genre.find(params[:genre_id].to_i)
      @items = @genres.items.where(is_active: true).page(params[:page]).per(8)
    else
      # 何もしない場合
    end
    render "search"
  end
end
