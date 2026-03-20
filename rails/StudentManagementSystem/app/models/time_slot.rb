class TimeSlot < ApplicationRecord
  has_many :timetables, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :position, uniqueness: true
  validates :start_time, :end_time, presence: true
  validate :end_after_start

  def end_after_start
    if start_time.present? && end_time.present? && end_time <= start_time
      errors.add(:end_time, "must be after start time")
    end
  end
end