class AcademicYear < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :timetables, dependent: :destroy
  has_many :exam_results, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :class_subjects, dependent: :destroy
  has_many :teacher_assignments, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validates :start_date, comparison: { less_than: :end_date }
  validates :active, inclusion: { in: [true, false] }
end