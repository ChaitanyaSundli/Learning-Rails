class Timetable < ApplicationRecord
  belongs_to :class_subject
  belongs_to :teacher

  has_one :school_class, through: :class_subject
  has_one :subject, through: :class_subject

  validates :class_subject_id, uniqueness: {
    scope: [:day, :start_time],
    message: "Class already has a subject at this time"
  }

  validate :teacher_not_double_booked
  validate :class_not_double_booked

  def teacher_not_double_booked
    if Timetable.exists?(
      teacher_id: teacher_id,
      day: day,
      start_time: start_time
    )
      errors.add(:teacher, "already assigned at this time")
    end
  end

  def class_not_double_booked
    if Timetable.joins(:class_subject).where(
      class_subjects: { school_class_id: class_subject.school_class_id },
      day: day,
      start_time: start_time
    ).exists?
      errors.add(:base, "Class already has a subject at this time")
    end
  end
end