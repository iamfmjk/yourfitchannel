class Video < ApplicationRecord
  belongs_to :user
  has_many :workouts
  validates :title, presence: true
  validates :youtube_id, presence: true
end
