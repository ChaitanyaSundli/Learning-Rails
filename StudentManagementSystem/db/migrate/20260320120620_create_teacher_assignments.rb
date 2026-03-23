class CreateTeacherAssignments < ActiveRecord::Migration[8.1]
  def change
    create_table :teacher_assignments do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :class_subject, null: false, foreign_key: true
      t.references :academic_year, null: false, foreign_key: true

      t.timestamps
    end
  end
end