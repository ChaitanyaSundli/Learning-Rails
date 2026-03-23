class Department < ApplicationRecord
    
    has_many :teachers, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    def hod
        teachers.find_by(is_hod: true)
    end 
end
