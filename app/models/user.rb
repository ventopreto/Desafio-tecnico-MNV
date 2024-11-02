class User < ApplicationRecord
  has_many :rentals

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validate :validate_email_format
end

def validate_email_format
  return if email.blank?
  unless email.match?(URI::MailTo::EMAIL_REGEXP)
    errors.add(:email, "deve ser um formato válido")
  end
end
