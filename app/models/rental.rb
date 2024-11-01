class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :start_date, :user_id, :book_id, presence: true
  validate :end_date_after_start_date, if: :end_date_present?
end

private

def end_date_present?
  end_date.present?
end

def end_date_after_start_date
  if end_date < start_date
    errors.add(:end_date, "deve ser posterior à data de início")
  end
end
