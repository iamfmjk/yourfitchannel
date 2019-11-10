class Workout < ApplicationRecord

  belongs_to :user
  belongs_to :video

  validates :title, presence: true
  validates :video_id, presence: true
  validates :scheduled_for, presence: true
  validate :schedule_for_future_only


  def start_time
    self.scheduled_for
  end

  def schedule_for_future_only
    if scheduled_for.present? && scheduled_for < DateTime.current
      errors.add(:scheduled_for, ": date must be in the future")
    end
  end

end
