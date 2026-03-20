class Exam < ApplicationRecord
  belongs_to :class_subject
  belongs_to :academic_year
  belongs_to :time_slot

  has_many :exam_results, dependent: :destroy

  validates :exam_type, :exam_date, presence: true
  validates :max_mark, numericality: { greater_than: 0 }
  validates :pass_mark, numericality: { greater_than_or_equal_to: 0 }
end