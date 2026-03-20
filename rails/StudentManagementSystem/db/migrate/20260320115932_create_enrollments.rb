class CreateEnrollments < ActiveRecord::Migration[8.1]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :school_class, null: false, foreign_key: true
      t.references :academic_year, null: false, foreign_key: true
      t.string :status # active, promoted, graduated, transferred

      t.timestamps
    end
  end
end