class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def subtotal
    item.with_tax_price * quantity
  end

  def self.cart_total_amount
    sum("item.price_with_tax * quantity")
  end

end
