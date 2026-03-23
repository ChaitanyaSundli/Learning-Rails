class Timetable < ApplicationRecord
  belongs_to :class_subject
  belongs_to :academic_year
  belongs_to :time_slot

  has_one :school_class, through: :class_subject
  has_one :subject, through: :class_subject
  has_many :teacher_assignments, through: :class_subject
  has_many :teachers, through: :teacher_assignments

  DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday]

  validates :day_of_week, presence: true, inclusion: { in: DAYS }

  validates :class_subject_id, uniqueness: {
    scope: [:day_of_week, :time_slot_id, :academic_year_id],
    message: "already scheduled"
  }

  validate :teacher_not_double_booked
  
  def teacher_not_double_booked
    teacher_ids = TeacherAssignment
    .where(class_subject_id: class_subject_id, academic_year_id: academic_year_id)
    .pluck(:teacher_id)
    
    return if teacher_ids.empty?
    
    if Timetable.joins(class_subject: :teacher_assignments)
      .where(teacher_assignments: { teacher_id: teacher_ids, academic_year_id: academic_year_id })
      .where(day_of_week: day_of_week, time_slot_id: time_slot_id)
      .where.not(id: id)
      .exists?
      
      errors.add(:base, "Teacher already assigned at this time")
    end
  end

end