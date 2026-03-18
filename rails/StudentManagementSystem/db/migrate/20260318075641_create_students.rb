class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :name
      t.date :dob
      t.string :phone
      t.string :address
      t.references :school_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
