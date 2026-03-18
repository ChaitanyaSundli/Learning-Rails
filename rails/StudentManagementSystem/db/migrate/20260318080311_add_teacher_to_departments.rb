class AddTeacherToDepartments < ActiveRecord::Migration[8.1]
  def change
    add_reference :departments, :teacher, null: false, foreign_key: true
  end
end
