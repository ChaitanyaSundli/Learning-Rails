class SchoolClass < ApplicationRecord
  belongs_to :location

  has_many :subjects, dependent: :destroy
  has_many :timetables, dependent: :destroy
end
