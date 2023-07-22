class Item < ApplicationRecord
  TAX_RATE = 10 #%表記

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_many :orders, through: :order_details


  def with_tax_price
    (price * (1 + TAX_RATE * 0.01)).floor
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image
  end

  validates :is_active, inclusion: {in: [true, false]} #販売ステータス

end
