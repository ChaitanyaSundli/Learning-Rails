class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :dob
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
