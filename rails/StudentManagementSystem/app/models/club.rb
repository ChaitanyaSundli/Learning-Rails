class Club < ApplicationRecord
  belongs_to :teacher

  has_many :club_member, dependent: :destroy
  has_many :club_schedule, dependent: :destroy
end
