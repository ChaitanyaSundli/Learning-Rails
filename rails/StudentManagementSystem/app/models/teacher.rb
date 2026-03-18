class Teacher < ApplicationRecord
  belongs_to :department

  has_many :timetables, dependent: :destroy
  has_one :club, dependent: :destroy

  scope :hods, -> { where(is_hod: true) }

  validate :only_one_hod_per_department
  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\d{10}\z/ }, allow_blank: true

  def only_one_hod_per_department
    return unless is_hod

    if department.teachers.where(is_hod: true).where.not(id: id).exists?
      errors.add(:is_hod, "already exists for this department")
    end
  end
end
