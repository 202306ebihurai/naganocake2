class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(4) #商品を作成日が新しい順で4件取得
  end

  def about
  end
end
