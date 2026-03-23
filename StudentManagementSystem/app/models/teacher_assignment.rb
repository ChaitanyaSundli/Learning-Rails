class TeacherAssignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :class_subject
  belongs_to :academic_year

  validates :class_subject_id, uniqueness: {
    scope: :academic_year_id,
    message: "already has a teacher assigned for this year"
  }

  validates :teacher_id, uniqueness: {
    scope: [:class_subject_id, :academic_year_id],
    message: "already assigned"
  }
end