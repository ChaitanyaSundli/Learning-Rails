class CreateTimetables < ActiveRecord::Migration[8.1]
  def change
    create_table :timetables do |t|
      t.references :school_class, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.date :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
