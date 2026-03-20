class ExamResult < ApplicationRecord
  belongs_to :student
  belongs_to :exam

  before_save :round_marks

  
  private
  
  def round_marks
    self.marks_obtained = marks_obtained.round if marks_obtained.present?
    self.grade = get_grade(self.marks_obtained)
  end

  def get_grade(score)
    case score
    when 90..100 then "A+"
    when 80..89  then "A"
    when 70..79  then "B+"
    when 60..69  then "B"
    when 55..59  then "C+"
    when 50..54  then "C"
    when 45..49  then "D+"
    when 40..44  then "D"
    when 30..39  then "E"
      else "F"
    end
  end


end
