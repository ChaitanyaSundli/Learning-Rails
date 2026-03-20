class UpdateReferencesInExam < ActiveRecord::Migration[8.1]
  def change
  remove_reference :exams, :subject, foreign_key: true
  remove_reference :exams, :school_class, foreign_key: true

  add_reference :exams, :class_subject, foreign_key: true
  end
end
