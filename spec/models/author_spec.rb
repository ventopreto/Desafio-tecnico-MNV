# frozen_string_literal: true

require "rails_helper"

RSpec.describe Author, type: :model do
  describe "validações" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(100) }
  end
end
