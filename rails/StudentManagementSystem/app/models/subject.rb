class Subject < ApplicationRecord

    has_many :exams, dependent: :destroy
    has_many :timetables, dependent: :destroy
    has_many :class_subjects, dependent: :destroy
end
