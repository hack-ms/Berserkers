class Work < ApplicationRecord
  belongs_to :city
  belongs_to :work_type, optional: true

  validates_uniqueness_of :idn_empreendimento
end
