class PromoCode < ApplicationRecord

  validates_uniqueness_of :code
  validates_presence_of :code, :company_name, :description

  has_many :exchanges, dependent: :destroy


  def decrement_quantity!
    new_quantity = self.quantity--
    new_quantity = 0 unless new_quantity >= 0 
    
    self.update(quantity: self.quantity)
  end
end
