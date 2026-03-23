class ExamResult < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  belongs_to :academic_year

  validates :marks_obtained, presence: true
  validate :marks_within_limit

  before_save :calculate_grade

  private

  def calculate_grade
    score = marks_obtained.to_i

    self.grade =
      case score
      when 90..100 then "A+"
      when 80..89 then "A"
      when 70..79 then "B+"
      when 60..69 then "B"
      when 50..59 then "C"
      when 40..49 then "D"
      else "F"
      end
  end
  
  def marks_within_limit
    if marks_obtained > exam.max_mark
      errors.add(:marks_obtained, "cannot exceed max marks")
    end
  end
end