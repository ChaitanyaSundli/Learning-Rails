class CreateAcademicYears < ActiveRecord::Migration[8.1]
  def change
    create_table :academic_years do |t|
      t.string :name, null: false 
      t.date :start_date
      t.date :end_date
      t.boolean :active, default: false

      t.timestamps
    end
  end
end