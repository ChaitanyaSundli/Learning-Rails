class ClubMember < ApplicationRecord
  belongs_to :student
  belongs_to :club

  validates :student_id, uniqueness: true 
  validates :club_id, presence: true

end
