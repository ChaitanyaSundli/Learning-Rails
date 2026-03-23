class CreateClassSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :class_subjects do |t|
      t.references :school_class, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.integer :credit
      t.string :syllabus

      t.timestamps
    end
  end
end
