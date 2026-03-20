class SchoolClass < ApplicationRecord
  belongs_to :location
  belongs_to :academic_year

  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  has_many :class_subjects, dependent: :destroy
  has_many :timetables, through: :class_subjects
  has_many :subjects, through: :class_subjects

  validates :grade_lvl, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :section, presence: true, uniqueness: { scope: :grade_lvl }
end