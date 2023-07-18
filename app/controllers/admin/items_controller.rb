class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
  end

  def index
    @items = Item.all
    @item =  Item.find(params[:id])
  end

  def edit
  end

  def show
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
      params.require(:item).permit(:image, :name, :introduction, :price)
    end


