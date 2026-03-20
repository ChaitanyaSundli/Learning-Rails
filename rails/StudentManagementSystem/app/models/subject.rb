class Subject < ApplicationRecord
  has_many :class_subjects, dependent: :destroy
  has_many :school_classes, through: :class_subjects
  has_many :exams, through: :class_subjects

  validates :name, presence: true, uniqueness: true
end