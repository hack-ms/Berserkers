class Work < ApplicationRecord
  belongs_to :city
  belongs_to :work_type, optional: true

  has_many :complaints, dependent: :destroy
  validates_uniqueness_of :idn_empreendimento
end
