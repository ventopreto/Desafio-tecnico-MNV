# frozen_string_literal: true

class Book < ApplicationRecord
  has_one :rental
  belongs_to :author

  validates :title, presence: true
  validates :author_id, presence: true
end
