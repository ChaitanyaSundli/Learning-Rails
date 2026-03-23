class RemoveTimeSlotFromAttendances < ActiveRecord::Migration[8.1]
  def change
    remove_reference :attendances, :time_slot, null: false, foreign_key: true
  end
end