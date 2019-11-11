class Video < ApplicationRecord
  belongs_to :user
  has_many :workouts, dependent: :destroy

  validates :title, presence: true
  validates :youtube_id, presence: true
end
