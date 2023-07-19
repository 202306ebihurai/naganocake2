class Address < ApplicationRecord

  belongs_to :customer

  def address_display
    '〒' + postcode + ' ' + address + ' ' + receiver
  end

end
