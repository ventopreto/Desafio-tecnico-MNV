pessoa = Author.create!(name: "Fernando Pessoa", biography: "Um dos maiores poetas da língua portuguesa.")
user = User.create!(name: "Usuario Generico", email: "usuario@example.com")
desassossego = Book.create!(title: "Desassossego", synopsis: "Um livro de Fernando Pessoa", published_at: Date.new(1933), author: pessoa)
Rental.create!(start_date: Date.today, end_date: Date.today + 1, book: desassossego, user: user)
