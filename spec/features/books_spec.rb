# frozen_string_literal: true

require "rails_helper"

RSpec.feature "books", type: :feature do
  let!(:book_without_rental) { create(:book, :amor_de_perdicao) }
  let!(:book_with_rental) { create(:book, :with_rental) }

  it "visualizar a página de listagem de livros" do
    visit books_path
    expect(page).to have_content("Livros")
    expect(page).to have_content(book_without_rental.title)
  end

  it "visualizar a página de detalhes de um livro" do
    visit book_path(book_without_rental)
    expect(page).to have_content("Livros")
    expect(page).to have_content(book_without_rental.title)
    expect(page).to have_content(book_without_rental.synopsis)
    expect(page).to have_content(book_without_rental.published_at)
  end

  it "cadastrar um novo livro" do
    visit new_book_path
    fill_in "book_title", with: "Novo Livros"
    fill_in "book_synopsis", with: "usuario@gmail.com"
    fill_in "book_published_at", with: "1933-01-01"
    select "Fernando Pessoa", from: "book_author_id"

    click_button "Cadastrar"

    expect(page).to have_content("Livro cadastrado com sucesso")
    expect(page).to have_content("Novo Livros")
  end

  it "não foi possivel cadastrar um novo livro" do
    visit new_book_path
    fill_in "book_title", with: ""
    click_button "Cadastrar"

    expect(page).to have_content("Não foi possivel cadastrar o Livro")
  end

  it "atualizar um livro existente" do
    visit edit_book_path(book_without_rental)
    fill_in "book_title", with: "Livros Editado"
    fill_in "book_synopsis", with: "blabla e tal"
    fill_in "book_published_at", with: "1933-01-01"
    select "Fernando Pessoa", from: "book_author_id"
    click_button "Atualizar"

    expect(page).to have_content("Livro atualizado com sucesso")
    expect(page).to have_content("Livros Editado")
  end

  it "não foi possivel atualizar um novo livro" do
    visit edit_book_path(book_without_rental)
    fill_in "book_title", with: ""
    click_button "Atualizar"

    expect(page).to have_content("Não foi possivel atualizar o Livro")
  end

  it "excluir um livro sem livros emprestimos" do
    visit book_path(book_without_rental)
    click_button "Excluir"

    expect(page).to have_content("Livro excluido com sucesso")
    expect(page).not_to have_content(book_without_rental.title)
  end

  it "excluir um livro com emprestimos" do
    visit book_path(book_with_rental)
    click_button "Excluir"

    expect(page).to have_content("Livro não pode ser excluido, pois existem empréstimos ativos")
    expect(page).to have_content(book_with_rental.title)
  end
end
