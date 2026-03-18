class Location < ApplicationRecord

    has_many :club_schedules, dependent: :destroy
    has_many :school_classes, dependent: :destroy

    has_many :clubs, through: :club_schedules, dependent: :destroy

    validates :name, presence: true, uniqueness: true
end
