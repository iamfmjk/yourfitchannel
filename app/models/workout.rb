class Workout < ApplicationRecord

  belongs_to :user
  belongs_to :video


  validates :title, presence: true
  validates :video_id, presence: true
  validates :scheduled_for, presence: true

  def start_time
    self.scheduled_for
  end
end
