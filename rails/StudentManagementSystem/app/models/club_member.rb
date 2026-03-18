class ClubMember < ApplicationRecord
  belongs_to :student
  belongs_to :club
end
