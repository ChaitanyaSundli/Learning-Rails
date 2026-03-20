class AddAcademicYearToClassSubjects < ActiveRecord::Migration[8.1]
  def change
    add_reference :class_subjects, :academic_year, foreign_key: true
  end
end