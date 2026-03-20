class Club < ApplicationRecord
  belongs_to :teacher

  has_many :club_members, dependent: :destroy
  has_many :students, through: :club_members

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
end