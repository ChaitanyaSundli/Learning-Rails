class AddPasswordToTeacher < ActiveRecord::Migration[8.1]
  def change
    add_column :teachers, :password, :string
  end
end
