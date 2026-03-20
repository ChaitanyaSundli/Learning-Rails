class AddAcademicYearToSchoolClasses < ActiveRecord::Migration[8.1]
  def change
    add_reference :school_classes, :academic_year, foreign_key: true
  end
end