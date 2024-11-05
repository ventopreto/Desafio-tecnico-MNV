# frozen_string_literal: true

require "rails_helper"

RSpec.feature "users", type: :feature do
  let!(:user) { create(:user, :maria) }
  let(:user_with_rental) { create(:user, :with_rental) }

  it "visualizar a página de listagem de usuários" do
    visit users_path
    expect(page).to have_content("Usuários")
    expect(page).to have_content(user.name)
  end

  it "visualizar a página de detalhes de um usuário" do
    visit user_path(user)
    expect(page).to have_content("Usuários")
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end

  it "cadastrar um novo usuário" do
    visit new_user_path
    fill_in "user_name", with: "Novo Usuário"
    fill_in "user_email", with: "usuario@gmail.com"

    click_button "Cadastrar"

    expect(page).to have_content("Usuário cadastrado com sucesso")
    expect(page).to have_content("Novo Usuário")
  end

  it "não foi possivel cadastrar um novo usuário" do
    visit new_user_path
    fill_in "user_name", with: ""
    click_button "Cadastrar"

    expect(page).to have_content("Não foi possivel cadastrar o usuário")
  end

  it "atualizar um usuário existente" do
    visit edit_user_path(user)
    fill_in "user_name", with: "Usuário Editado"
    click_button "Atualizar"

    expect(page).to have_content("Usuário atualizado com sucesso")
    expect(page).to have_content("Usuário Editado")
  end

  it "não foi possivel atualizar um novo usuário" do
    visit edit_user_path(user)
    fill_in "user_name", with: ""
    click_button "Atualizar"

    expect(page).to have_content("Não foi possivel atualizar o usuário")
  end

  it "excluir um Usuário sem livros associados" do
    visit user_path(user)
    click_button "Excluir"

    expect(page).to have_content("Usuário excluido com sucesso")
    expect(page).not_to have_content(user.name)
  end

  it "excluir um Usuário com livros associados" do
    visit user_path(user_with_rental)
    click_button "Excluir"

    expect(page).to have_content("Usuário não pode ser excluido, pois existem empréstimos ativos")
    expect(page).to have_content(user.name)
  end
end
