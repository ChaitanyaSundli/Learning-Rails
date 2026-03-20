class SchoolClass < ApplicationRecord
  belongs_to :location

  has_many :students
  has_many :class_subjects
  
  has_many :timetables, through: :class_subjects
  has_many :teachers, through: :timetables
  has_many :subjects, through: :class_subjects

  validates :grade_lvl, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :section, presence: true
  validates :section, uniqueness: { scope: :grade_lvl, message: "already exists for this grade level" }
end
