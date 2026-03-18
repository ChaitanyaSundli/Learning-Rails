class UpdateTimetableToUseClassSubject < ActiveRecord::Migration[7.0]
  def change
    add_reference :timetables, :class_subject, null: false, foreign_key: true

    remove_reference :timetables, :school_class, foreign_key: true
    remove_reference :timetables, :subject, foreign_key: true
  end
end