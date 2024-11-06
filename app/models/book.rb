# frozen_string_literal: true

class Book < ApplicationRecord
  has_one :rental
  belongs_to :author

  validates :title, presence: true
  validates :author_id, presence: true

  delegate :status, :start_date, :translate_status, to: :rental, allow_nil: true
  delegate :name, :biography, to: :author
end
