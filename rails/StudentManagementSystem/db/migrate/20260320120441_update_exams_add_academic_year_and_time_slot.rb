class UpdateExamsAddAcademicYearAndTimeSlot < ActiveRecord::Migration[8.1]
  def change
    add_reference :exams, :academic_year, foreign_key: true
    add_reference :exams, :time_slot, foreign_key: true
  end
end