class Subject < ApplicationRecord

    has_many :exams, dependent: :destroy,through: :class_subject
    has_many :timetables, dependent: :destroy
    has_many :class_subjects, dependent: :destroy

    has_many :school_classes, through: :class_subjects
    has_many :teachers, through: :timetables

    validates :name, presence: true, uniqueness: true

end
