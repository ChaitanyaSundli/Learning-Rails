class BackfillEnrollments < ActiveRecord::Migration[8.1]
  
  class Student < ActiveRecord::Base; end
  class Enrollment < ActiveRecord::Base; end
  class AcademicYear < ActiveRecord::Base; end
  
  def up
    default_year = AcademicYear.first || AcademicYear.create!(name: "Initial Year")

    Student.find_each do |student|
      Enrollment.create!(
        student_id: student.id,
        school_class_id: student.school_class_id,
        academic_year_id: default_year.id,
        status: "active"
      )
    end
  end

  def down
    Enrollment.delete_all
  end
end