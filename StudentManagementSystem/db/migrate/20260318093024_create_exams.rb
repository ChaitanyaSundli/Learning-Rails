class CreateExams < ActiveRecord::Migration[8.1]
  def change
    create_table :exams do |t|
      t.references :subject, null: false, foreign_key: true
      t.string :exam_type
      t.date :exam_date
      t.time :start_time
      t.time :end_time
      t.integer :max_mark
      t.integer :pass_mark

      t.timestamps
    end
  end
end
