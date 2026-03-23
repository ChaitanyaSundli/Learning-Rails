class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :academic_year

  validates :date, :status, presence: true
  validates :status, inclusion: { in: %w[present absent late] }

  validates :student_id, uniqueness: {
    scope: [:date],
    message: "attendance already marked for this slot"
  }
end