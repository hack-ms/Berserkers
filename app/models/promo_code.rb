class PromoCode < ApplicationRecord

  validates_uniqueness_of :code
  validates_presence_of :code, :company_name, :description

end
