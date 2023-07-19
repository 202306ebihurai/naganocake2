class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create #商品の新規登録
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update #商品の更新
    @item = Item.find(params[:id])
    @item.update (item_params)
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end
end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image
  end

  private
    def item_params
      params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active)
    end


