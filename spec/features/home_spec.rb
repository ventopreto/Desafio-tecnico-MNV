require "rails_helper"

RSpec.feature "Home", type: :feature do
  it "Visita a home page" do
    visit root_path
    expect(page).to have_content("Autores")
    expect(page).to have_content("Livros")
    expect(page).to have_content("Emprestimos")
    expect(page).to have_content("Usuários")
    expect(page).to have_content("Boas vindas ao Sistema de Gerenciamento de Biblioteca com Empréstimo de Livros")
  end
end
