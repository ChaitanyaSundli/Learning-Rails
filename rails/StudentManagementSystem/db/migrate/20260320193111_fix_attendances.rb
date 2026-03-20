class FixAttendances < ActiveRecord::Migration[8.1]
  def change
    change_column_null :attendances, :time_slot_id, false
    change_column_null :attendances, :academic_year_id, false

    add_index :attendances,
      [:student_id, :date, :time_slot_id],
      unique: true,
      name: "index_unique_attendance"
  end
end