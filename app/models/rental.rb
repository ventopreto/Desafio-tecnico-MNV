# frozen_string_literal: true

class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: {active: "active", completed: "completed"}

  validates :start_date, :user_id, :book_id, presence: true
  validate :end_date_after_start_date, if: :end_date_present?
  validate :no_active_rental_for_book, on: :create

  delegate :title, :synopsis, :published_at, to: :book
  delegate :name, :email, to: :user

  after_initialize do
    self.status ||= "active"
  end

  def translate_status
    I18n.t("activerecord.attributes.rental.status.#{status}")
  end
end

private

def no_active_rental_for_book
  return unless Rental.exists?(book_id:, status: "active")

  errors.add(:base, I18n.t("rentals.errors.already_rented"))
end

def end_date_present?
  end_date.present?
end

def end_date_after_start_date
  return unless end_date < start_date

  errors.add(:end_date, I18n.t("rentals.errors.end_date>start_date"))
end
