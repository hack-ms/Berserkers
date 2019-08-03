class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :work

  mount_uploader :photo, PhotoUploader
end
