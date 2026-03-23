class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :school_class
  belongs_to :academic_year
  validate :only_one_active_class
  

  validates :student_id, uniqueness: { scope: :academic_year_id }
  validates :status, presence: true, inclusion: { in: %w[active completed transferred] }

  def only_one_active_class
    return unless status == "active"

    if Enrollment.where(student_id: student_id, academic_year_id: academic_year_id, status: "active")
                 .where.not(id: id)
                 .exists?
      errors.add(:base, "Student already has an active class in this academic year")
    end
  end

end