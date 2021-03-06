class Work < ApplicationRecord
  belongs_to :city
  belongs_to :work_type, optional: true

  has_many :complaints, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :interested_users, through: :favorites, source: :user, class_name: "User"

  after_update :notify_interested_parties

  validates_uniqueness_of :idn_empreendimento

  scope :by_city_id, -> (city_id) do
    where(city_id: city_id)
  end

  private

  def notify_interested_parties
    self.interested_users.find_each do |user|
      ApplicationMailer.new_update_work(self.id, user.id).deliver_now
    end
  end

end
