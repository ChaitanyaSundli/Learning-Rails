class FixExamsTimeStructure < ActiveRecord::Migration[8.1]
  def change
    remove_column :exams, :start_time, :time
    remove_column :exams, :end_time, :time

    change_column_null :exams, :time_slot_id, false
    change_column_null :exams, :academic_year_id, false
    change_column_null :exams, :class_subject_id, false
  end
end