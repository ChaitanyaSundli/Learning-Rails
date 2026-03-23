class Note < ApplicationRecord
  validates :title, presence: true
  validates :message, presence: true
  
  attribute :is_pinned, :boolean, default: false

  validate :reminder_cannot_be_in_the_past

  private

  def reminder_cannot_be_in_the_past
    if reminder_at.present? && reminder_at < Time.current
      errors.add(:reminder_at, "must be in the future")
    end
  end
end
