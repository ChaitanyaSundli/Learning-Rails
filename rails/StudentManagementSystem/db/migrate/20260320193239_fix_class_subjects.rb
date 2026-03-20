class FixClassSubjects < ActiveRecord::Migration[8.1]
  def change
    change_column_null :class_subjects, :academic_year_id, false

    add_index :class_subjects,
      [:school_class_id, :subject_id, :academic_year_id],
      unique: true,
      name: "index_unique_class_subject"
  end
end