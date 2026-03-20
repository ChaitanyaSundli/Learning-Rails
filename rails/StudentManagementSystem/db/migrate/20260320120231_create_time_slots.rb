class CreateTimeSlots < ActiveRecord::Migration[8.1]
  def change
    create_table :time_slots do |t|
      t.string :name # "Period 1"
      t.time :start_time
      t.time :end_time
      t.integer :position

      t.timestamps
    end
  end
end