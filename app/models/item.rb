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
  
  def total_item_amount #アイテム合計金額
    order_details.sum { |order_detail| order_detail.subtotal }
  end


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
     image.variant(resize_to_limit: [width, height]).processed
  end

  validates :is_active, inclusion: {in: [true, false]} #販売ステータス


end
