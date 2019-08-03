class Work < ApplicationRecord
  belongs_to :city
  belongs_to :work_type, optional: true

  has_many :complaints, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates_uniqueness_of :idn_empreendimento

  scope :by_city_id, -> (city_id) do
    where(city_id: city_id)
  end
end
