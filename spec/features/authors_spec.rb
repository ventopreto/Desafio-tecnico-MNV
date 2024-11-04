require "rails_helper"

RSpec.feature "Authors", type: :feature do
  let!(:author) { Author.create(name: "Exemplo Autor") }
  let!(:book) { Book.create(title: "Livro Exemplo", author: author) }
  let!(:author_without_book) { Author.create(name: "Autor Generico") }

  it "visualizar a página de listagem de autores" do
    visit authors_path
    expect(page).to have_content("Autores")
    expect(page).to have_content(author.name)
  end

  it "cadastrar um novo autor" do
    visit new_author_path
    fill_in "author_name", with: "Novo Autor"
    click_button "Cadastrar"

    expect(page).to have_content("Autor cadastrado com sucesso")
    expect(page).to have_content("Novo Autor")
  end

  it "não foi possivel cadastrar um novo autor" do
    visit new_author_path
    fill_in "author_name", with: ""
    click_button "Cadastrar"

    expect(page).to have_content("Não foi possivel cadastrar o autor")
  end

  it "atualizar um autor existente" do
    visit edit_author_path(author)
    fill_in "author_name", with: "Autor Editado"
    click_button "Atualizar"

    expect(page).to have_content("Autor atualizado com sucesso")
    expect(page).to have_content("Autor Editado")
  end

  it "não foi possivel atualizar um novo autor" do
    visit edit_author_path(author)
    fill_in "author_name", with: ""
    click_button "Atualizar"

    expect(page).to have_content("Não foi possivel atualizar o autor")
  end

  it "excluir um autor sem livros associados" do
    visit author_path(author_without_book)
    click_button "Excluir"

    expect(page).to have_content("Autor excluido com sucesso")
    expect(page).not_to have_content(author_without_book.name)
  end

  it "não foi possivel excluir um autor com livros associados" do
    visit author_path(author)
    click_button "Excluir"

    expect(page).to have_content("Autor não pode ser excluido, pois existem livros associados")
    expect(page).to have_content(author.name)
  end
end
