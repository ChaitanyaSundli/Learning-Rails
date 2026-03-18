class Student < ApplicationRecord
  belongs_to :school_class

  has_many :attendances, dependent: :destroy
  has_one :club_member, dependent: :destroy
  has_many :exam_results, dependent: :destroy

  has_one :club, through: :club_member
  has_many :exams, through: :exam_results

  validates :school_class_id, presence: true

  validates :name, :dob, :address, presence: true
  validate :dob_in_the_past
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" },uniqueness: true
  validates :school_class_id, presence: true

  private

  def dob_in_the_past
    if dob.present? && dob >= Date.today
      errors.add(:dob, "must be in the past")
    end
  end
end

