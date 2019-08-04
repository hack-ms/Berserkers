class User < ApplicationRecord

  SCORE_POINTS = 1

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :complaints, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :exchanges, dependent: :destroy

  before_create :initial_score!

  def increment_score!
    self.update(score: self.score + SCORE_POINTS)
  end

  private
    def initial_score!
      score = rand(50..120)
    end
 
end
