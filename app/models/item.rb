class Item < ApplicationRecord
  TAX_RATE = 10 #%表記

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_many :orders, through: :order_details


  def with_tax_price#税込み価格
    (price * (1 + TAX_RATE * 0.01)).floor
  end
  
  #def item_quantity #アイテム小計
   # (item.with_tax_price * quantity)
  #end
  
  def total_item_amount#アイテム数量
    order_details.sum { |order_detail| order_detail.subtotal }
  end

  validates :is_active, inclusion: {in: [true, false]} #販売ステータス


end
