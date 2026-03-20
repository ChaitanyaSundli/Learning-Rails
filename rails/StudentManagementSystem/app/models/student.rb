class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :school_classes, through: :enrollments
  has_many :academic_years, through: :enrollments

  has_many :attendances, dependent: :destroy
  has_many :exam_results, dependent: :destroy
  has_one :club_member, dependent: :destroy

  has_many :exams, through: :exam_results

  validates :name, :dob, :address, presence: true
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/ }
  validates :password, presence: true, length: { minimum: 6 }

  validate :dob_in_past

  private

  def dob_in_past
    errors.add(:dob, "must be in the past") if dob.present? && dob >= Date.today
  end
end