class CreateExamResults < ActiveRecord::Migration[8.1]
  def change
    create_table :exam_results do |t|
      t.references :student, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.integer :marks_obtained
      t.string :grade

      t.timestamps
    end
  end
end
