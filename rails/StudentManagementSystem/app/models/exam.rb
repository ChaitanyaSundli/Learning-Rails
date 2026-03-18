class Exam < ApplicationRecord
  belongs_to :subject

  has_many :exam_results, dependent: :destroy
end
