class ClassSubject < ApplicationRecord
  belongs_to :school_class
  belongs_to :subject

  has_many :timetables, dependent: :destroy
  has_many :exams
end
