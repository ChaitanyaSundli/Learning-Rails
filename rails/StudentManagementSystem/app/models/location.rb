class Location < ApplicationRecord

    has_many :club_schedule, dependent: :destroy
    has_many :school_class, dependent: :destroy
end
