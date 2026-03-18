class ClubSchedule < ApplicationRecord
  belongs_to :club
  belongs_to :location

  validate :no_location_overlap

  def no_location_overlap
    if ClubSchedule.where(location_id: location_id)
                   .where.not(id: id)
                   .where("start_time < ? AND end_time > ?", end_time, start_time)
                   .exists?
      errors.add(:base, "Location already booked for another club")
    end
  end
end