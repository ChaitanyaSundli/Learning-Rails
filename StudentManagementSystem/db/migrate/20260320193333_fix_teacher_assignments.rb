class FixTeacherAssignments < ActiveRecord::Migration[8.1]
  def change
    add_index :teacher_assignments,
      [:class_subject_id, :academic_year_id],
      unique: true,
      name: "index_one_teacher_per_subject_per_year"
  end
end