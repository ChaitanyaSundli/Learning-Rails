class RemoveTeacherFromDepartments < ActiveRecord::Migration[8.1]
  def change
    remove_reference :departments, :teacher, null: false, foreign_key: true
  end
end
