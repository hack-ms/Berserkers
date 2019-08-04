class PromoCode < ApplicationRecord

  validates_uniqueness_of :code
  validates_presence_of :code, :company_name, :description

  has_many :exchanges, dependent: :destroy

  mount_uploader :company_logo, PhotoUploader

  def decrement_quantity!
    update(quantity: quantity - 1)
  end
end
