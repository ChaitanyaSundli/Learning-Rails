class Department < ApplicationRecord
    belongs_to :teacher
    has_many :teachers, dependent: :destroy
    has_one :teacher, dependent: :destroy
end
