class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates_uniqueness_of :user_id, scope: :work_id

  mount_uploader :photo, PhotoUploader
end
