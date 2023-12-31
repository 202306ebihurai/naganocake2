class Order < ApplicationRecord
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :address, presence: true
  validates :receiver, presence: true

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  def total_item_amount
    order_details.sum { |order_detail| order_detail.subtotal }
  end


  def full_name #姓+名表示
    self.last_name + " " + self.first_name
  end


end
