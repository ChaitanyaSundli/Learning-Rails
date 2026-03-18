class CreateSchoolClasses < ActiveRecord::Migration[8.1]
  def change
    create_table :school_classes do |t|
      t.integer :grade_lvl
      t.string :section
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
