class Teacher < ApplicationRecord
  belongs_to :department

  has_many :timetables, dependent: :destroy
  has_many :teacher_assignments, dependent: :destroy
  has_one :club, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\d{10}\z/ }, allow_blank: true
  validates :password, presence: true, length: { minimum: 6 }

  validate :only_one_hod_per_department

  def only_one_hod_per_department
    return unless is_hod

    if department.teachers.where(is_hod: true).where.not(id: id).exists?
      errors.add(:is_hod, "already exists for this department")
    end
  end
end