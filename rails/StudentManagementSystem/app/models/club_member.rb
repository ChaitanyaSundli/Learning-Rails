class ClubMember < ApplicationRecord
  belongs_to :student
  belongs_to :club

  validates :student_id, uniqueness: true
  validates :role, presence: true
end