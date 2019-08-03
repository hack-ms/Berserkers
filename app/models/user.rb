class User < ApplicationRecord

  SCORE_POINTS = 1

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :complaints, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def increment_score
    self.update(score: self.score + SCORE_POINTS)
  end 
end
