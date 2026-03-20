class FixTimetablesStructure < ActiveRecord::Migration[8.1]
  def change
    remove_reference :timetables, :teacher, foreign_key: true

    change_column :timetables, :day_of_week, :string

    change_column_null :timetables, :time_slot_id, false
    change_column_null :timetables, :academic_year_id, false
    change_column_null :timetables, :day_of_week, false

    add_index :timetables,
      [:class_subject_id, :day_of_week, :time_slot_id, :academic_year_id],
      unique: true,
      name: "index_unique_class_schedule"

    add_index :timetables,
      [:day_of_week, :time_slot_id, :academic_year_id],
      name: "index_time_lookup"
  end
end