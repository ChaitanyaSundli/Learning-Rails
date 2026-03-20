class UpdateTimetablesAddTimeSlotAndYear < ActiveRecord::Migration[8.1]
  def change
    add_reference :timetables, :time_slot, foreign_key: true
    add_reference :timetables, :academic_year, foreign_key: true

    remove_column :timetables, :start_time, :time
    remove_column :timetables, :end_time, :time
    remove_column :timetables, :day, :date

    add_column :timetables, :day_of_week, :integer
  end
end