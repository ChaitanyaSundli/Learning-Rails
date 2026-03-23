class RemoveTeacherFromDepartments < ActiveRecord::Migration[8.1]
  def change
    if column_exists?(:departments, :teacher_id)
      remove_column :departments, :teacher_id
    end
  end
end