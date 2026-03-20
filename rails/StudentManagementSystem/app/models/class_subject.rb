class ClassSubject < ApplicationRecord
  belongs_to :school_class
  belongs_to :subject
  belongs_to :academic_year

  has_many :timetables, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :teacher_assignments, dependent: :destroy


  validates :credit, presence: true, numericality: { greater_than: 0 }

  validates :subject_id, uniqueness: {
    scope: [:school_class_id, :academic_year_id],
    message: "already assigned to this class for the year"
  }
end