class PromoCode < ApplicationRecord

  validates_uniqueness_of :code
  validates_presence_of :code, :company_name, :description

  has_many :exchanges, dependent: :destroy


  def decrement_quantity!
    update(quantity: quantity - 1)
  end
end
