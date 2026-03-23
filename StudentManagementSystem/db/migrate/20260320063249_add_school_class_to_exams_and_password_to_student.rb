class AddSchoolClassToExamsAndPasswordToStudent < ActiveRecord::Migration[8.1]
  def change
    add_reference :exams, :school_class,foreign_key: true
    add_column :students, :password, :string

    target_ids = SchoolClass.pluck(:id)

    Exam.reset_column_information
    Exam.find_each do |row|
      row.update_column(:school_class_id, target_ids.sample)
    end
    change_column_null :exams, :school_class_id, false
  end
end