# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "validações" do
    before do
      User.create!(name: "Existing User", email: "unique@example.com")
    end
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value("example@test.com").for(:email) }
    it { should_not allow_value("invalid-email").for(:email) }
  end
end
