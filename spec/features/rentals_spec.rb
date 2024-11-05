require "rails_helper"

RSpec.feature "rentals", type: :feature do
  let!(:rental) { create(:rental, :for_os_maias) }
  let!(:rental_completed) { create(:rental, :for_amor_de_perdicao, status: "completed") }
  let!(:rental_active) { create(:rental, :for_ensaio_sobre_a_cegueira, status: "active") }

  it "visualizar a página de listagem de emprestimos" do
    visit rentals_path
    expect(page).to have_content("Emprestimos")
    expect(page).to have_content(rental.title)
  end

  it "visualizar a página de detalhes de um emprestimo" do
    visit rental_path(rental)
    expect(page).to have_content("Emprestimos")
    expect(page).to have_content(rental.start_date)
    expect(page).to have_content(rental.end_date)
    expect(page).to have_content(rental.name)
    expect(page).to have_content(rental.title)
    expect(page).to have_content(rental.synopsis)
    expect(page).to have_content(rental.published_at)
    expect(page).to have_content(rental.status)
  end

  it "cadastrar um novo emprestimo" do
    visit new_rental_path
    fill_in "rental_start_date", with: "1933-01-01"
    select "Amor de Perdição", from: "rental_book_id"
    select "Maria", from: "rental_user_id"

    click_button "Cadastrar"

    expect(page).to have_content("Empréstimo realizado com sucesso")
    expect(page).to have_content("Amor de Perdição")
    expect(page).to have_content("Maria da Silva")
  end

  it "não foi possivel cadastrar um novo emprestimo" do
    visit new_rental_path
    select "Amor de Perdição", from: "rental_book_id"
    click_button "Cadastrar"

    expect(page).to have_content("Não foi possivel realizar o empréstimo")
  end

  it "não foi possivel realizar o emprestimo, pois o livro já foi emprestado" do
    visit new_rental_path
    select "Ensaio sobre a cegueira", from: "rental_book_id"
    click_button "Cadastrar"

    expect(page).to have_content("Não foi possivel realizar o empréstimo")
    expect(page).to have_content("Já existe um emprestimo ativo para este livro.")
  end

  it "atualizar um emprestimo existente" do
    visit edit_rental_path(rental)
    fill_in "rental_start_date", with: "1933-01-01"
    select "Amor de Perdição", from: "rental_book_id"
    select "Maria", from: "rental_user_id"
    click_button "Atualizar"

    expect(page).to have_content("Empréstimo atualizado com sucesso")
    expect(page).to have_content("1933-01-01")
  end

  it "não foi possivel atualizar um novo emprestimo" do
    visit edit_rental_path(rental)
    visit edit_rental_path(rental)
    fill_in "rental_start_date", with: "2033-01-01"
    select "Amor de Perdição", from: "rental_book_id"
    select "Maria", from: "rental_user_id"
    click_button "Atualizar"

    expect(page).to have_content("Não foi possivel atualizar o empréstimo")
  end

  it "devolver um emprestimo" do
    visit rental_path(rental)
    click_button "Devolver"

    expect(page).to have_content("livro devolvido com sucesso")
  end

  it "devolver um emprestimo já completado" do
    visit rental_path(rental_completed)
    click_button "Devolver"

    expect(page).to have_content("Não foi possivel devolver o livro")
  end
end
