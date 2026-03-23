class AddIsHodToTeachers < ActiveRecord::Migration[8.1]
  def change
    add_column :teachers, :is_hod, :boolean
  end
end
