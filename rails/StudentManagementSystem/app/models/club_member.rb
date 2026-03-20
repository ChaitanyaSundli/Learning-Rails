class ClubMember < ApplicationRecord
  belongs_to :student
  belongs_to :club
  belongs_to :academic_year

  validates :student_id, uniqueness: {
    scope: [:club_id, :academic_year_id]
  }
  validates :student_id, uniqueness: { scope: :club_id }
  validates :role, presence: true
end