# frozen_string_literal: true

require "rails_helper"

RSpec.describe Rental, type: :model do
  let(:pessoa) do
    Author.create!(name: "Fernando Pessoa",
      biography: "Um dos maiores poetas da língua portuguesa.")
  end
  let(:user) { User.create!(name: "Usuario Generico", email: "usuario@example.com") }
  let(:desassossego) do
    Book.create!(title: "Desassossego", synopsis: "Um livro de Fernando Pessoa",
      published_at: Date.new(1933), author: pessoa)
  end

  before do
  end

  describe "associações" do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end

  describe "validações" do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:book_id) }

    context "quando end_date está presente" do
      let(:rental) { Rental.new(start_date: Time.zone.today, end_date: Date.yesterday, book: desassossego, user:) }

      it "retorna uma mensagem de erro quando start_date é depois de end_date" do
        rental.valid?
        expect(rental.errors[:end_date]).to include("deve ser posterior à data de início")
      end

      it "é valido quando end_date é depois de start_date" do
        rental.end_date = Date.tomorrow
        expect(rental).to be_valid
      end
    end
  end
end
