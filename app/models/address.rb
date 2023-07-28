class Address < ApplicationRecord
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/

  belongs_to :customer

  validates :postcode, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :address, presence: true
  validates :receiver, presence: true

  def address_display
    '〒' + postcode + ' ' + address + ' ' + receiver
  end

end
