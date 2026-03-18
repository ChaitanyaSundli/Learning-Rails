class Teacher < ApplicationRecord
  belongs_to :department

  has_many :timetables, dependent: :destroy
  has_one :club, dependent: :destroy
end
