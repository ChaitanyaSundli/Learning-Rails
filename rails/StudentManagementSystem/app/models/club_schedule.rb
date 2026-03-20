class ClubSchedule < ApplicationRecord
  belongs_to :club
  belongs_to :location

  validates :schedule_date, :start_time, :end_time, presence: true

  validate :no_overlap

  def no_overlap
    if ClubSchedule.where(location_id: location_id)
                   .where.not(id: id)
                   .where("start_time < ? AND end_time > ?", end_time, start_time)
                   .exists?
      errors.add(:base, "location already booked")
    end
  end
end