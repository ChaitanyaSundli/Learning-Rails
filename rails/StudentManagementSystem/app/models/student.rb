class Student < ApplicationRecord
  belongs_to :school_class

  has_many :attendences, dependent: :destroy
  has_one :club_member, dependent: :destroy
  has_many :exam_results, dependent: :destroy
end
