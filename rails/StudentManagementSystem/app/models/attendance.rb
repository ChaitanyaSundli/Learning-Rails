class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :time_slot
  belongs_to :academic_year

  validates :date, :status, presence: true
  validates :status, inclusion: { in: %w[present absent late] }

  validates :student_id, uniqueness: {
    scope: [:date, :time_slot_id],
    message: "attendance already marked for this slot"
  }
end