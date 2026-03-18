class CreateClubSchedules < ActiveRecord::Migration[8.1]
  def change
    create_table :club_schedules do |t|
      t.references :club, null: false, foreign_key: true
      t.string :activity_type
      t.date :schedule_date
      t.time :start_time
      t.time :end_time
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
