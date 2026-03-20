class Exam < ApplicationRecord
  belongs_to :class_subject

  has_many :exam_results, dependent: :destroy

  has_many :students, through: :exam_results

  validates :exam_type, :exam_date, presence: true
  validates :max_mark, numericality: { greater_than: 0 }
end