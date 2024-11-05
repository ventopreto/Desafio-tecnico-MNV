# frozen_string_literal: true

pessoa = create(:author, name: "Fernando Pessoa", biography: "Um dos maiores poetas da língua portuguesa.")
camilo = create(:author, name: "Camilo Castelo Branco",
  biography: "Um dos maiores romancistas do romantismo português.")
eca = create(:author, name: "Eça de Queirós",
  biography: "Considerado um dos melhores escritores realistas de Portugal.")
saramago = create(:author, name: "José Saramago",
  biography: "Escritor português, ganhador do Prêmio Nobel de Literatura.")

user = create(:user, name: "Usuario Generico", email: "usuario@example.com")
user2 = create(:user, name: "Maria da Silva", email: "maria.silva@example.com")
user3 = create(:user, name: "João Pereira", email: "joao.pereira@example.com")

amor_de_perdicao = create(:book, title: "Amor de Perdição",
  synopsis: "Um dos maiores clássicos do romantismo português.", published_at: Date.new(1862), author: camilo)
os_maias = create(:book, title: "Os Maias",
  synopsis: "Uma obra-prima da literatura portuguesa sobre o desencanto da vida aristocrática.", published_at: Date.new(1888), author: eca)
ensaio_sobre_a_cegueira = create(:book, title: "Ensaio sobre a cegueira",
  synopsis: "Um romance distópico sobre uma epidemia de cegueira.", published_at: Date.new(1995), author: saramago)
desassossego = create(:book, title: "Desassossego", synopsis: "Um livro de Fernando Pessoa",
  published_at: Date.new(1933), author: pessoa)

create(:rental, start_date: Time.zone.today, end_date: Time.zone.today + 1, book: desassossego, user:)
create(:rental, start_date: Time.zone.today, end_date: Time.zone.today + 3, book: amor_de_perdicao, user: user2)
create(:rental, start_date: Time.zone.today + 1, end_date: Time.zone.today + 4, book: os_maias, user:)
create(:rental, start_date: Time.zone.today + 2, end_date: Time.zone.today + 5, book: ensaio_sobre_a_cegueira, user: user3)
create(:rental, start_date: Time.zone.today + 3, end_date: Time.zone.today + 6, book: desassossego, user: user2)
