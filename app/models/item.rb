class Item < ApplicationRecord
  TAX_RATE = 0.1

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_many :orders, through: :order_details

  def price_with_tax
    (price * (1 + TAX_RATE)).round
  end

end
