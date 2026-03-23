class UpdateAttendances < ActiveRecord::Migration[8.1]
  def change
    add_reference :attendances, :time_slot, foreign_key: true
    add_reference :attendances, :academic_year, foreign_key: true
  end
end