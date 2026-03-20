class AddAcademicYearToExamResults < ActiveRecord::Migration[8.1]
  def change
    add_reference :exam_results, :academic_year, foreign_key: true
  end
end