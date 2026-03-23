class RemoveSchoolClassFromStudents < ActiveRecord::Migration[8.1]
  def change
    remove_reference :students, :school_class, foreign_key: true
  end
end