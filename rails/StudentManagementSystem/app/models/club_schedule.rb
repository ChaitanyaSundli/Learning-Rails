class ClubSchedule < ApplicationRecord
  belongs_to :club
  belongs_to :location
end
