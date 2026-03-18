class Club < ApplicationRecord
  belongs_to :teacher

  has_many :club_members, dependent: :destroy
  has_many :club_schedules, dependent: :destroy

  has_many :students, through: :club_members

  has_many :locations, through: :club_schedules

  validates :name, presence: true, uniqueness: true
  validates :teacher_id, presence: true
end
