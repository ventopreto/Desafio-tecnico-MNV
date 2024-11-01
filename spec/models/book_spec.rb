require "rails_helper"

RSpec.describe Book, type: :model do
  describe "associações" do
    it { should belong_to(:author) }
  end

  describe "validações" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author_id) }
  end
end
