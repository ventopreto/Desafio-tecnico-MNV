# README

## Sistema de Gerenciamento de Biblioteca com Empréstimo de Livros

## Sobre
Desenvolver uma aplicação em Rails para gerenciar uma biblioteca, possibilitando a criação, leitura, atualização e exclusão (CRUD) de autores, livros, usuários e empréstimos de livros. A aplicação deve demonstrar práticas de código limpo, relações de banco de dados eficientes e considerações de escalabilidade.


### Conteudo
=================
 
   * [Sobre o projeto](#sobre)
   * [Tabela de Conteúdo](#conteudo)
   * [Requisitos](#requisitos)
   * [Como usar](#como-usar)
   * [Testes](#testes)
 

### Requisitos
```YML
Requisitos Funcionais
  1.Modelos e Atributos:
    Author
      Atributos: name (string), biography (text)
    Book
      Atributos: title (string), synopsis (text), published_at (date)
    User
      Atributos: name (string), email (string)
    Rental
      Atributos: start_date (date), end_date (date), status (string) - valores possíveis: active, completed

  2.Funcionalidades:
    Authors:
      Listar todos os autores.✅
      Criar um novo autor.✅
      Editar as informações de um autor existente.✅
      Excluir um autor (somente se ele não tiver livros associados).✅
      Visualizar detalhes do autor, incluindo os livros associados.✅
  
    Books:
      Listar todos os livros. ✅
      Criar um novo livro, associando-o a um autor existente.✅
      Editar as informações de um livro existente. ✅
      Excluir um livro (somente se ele não tiver empréstimos ativos).✅
      Visualizar detalhes do livro, incluindo informações do autor e empréstimos associados.✅
  
    Users:
      Listar todos os usuários.  ✅
      Criar um novo usuário. ✅
      Editar as informações de um usuário existente.  ✅
      Excluir um usuário (somente se ele não tiver empréstimos ativos). ✅
      Visualizar detalhes do usuário, incluindo os empréstimos associados. ✅
  
    Rentals:
      Listar todos os empréstimos.✅
      Criar um novo empréstimo, associando-o a um livro disponível e a um usuário existente.✅
      Um livro só pode ter um empréstimo ativo por vez.
      Finalizar um empréstimo ativo, atualizando seu status para "completed" e definindo o end_date.✅
      Visualizar detalhes do empréstimo, incluindo informações do livro e do usuário associados.✅
    
  3.Interface:
      Implemente uma interface simples utilizando ERB ou qualquer framework de front-end de sua escolha.  ✅
      Forneça uma navegação intuitiva entre autores, livros, usuários e empréstimos.  ✅
      Indique visualmente o status de disponibilidade dos livros para empréstimo.✅
  4.Validações: 👍
      Author:
        name é obrigatório e não deve exceder 100 caracteres.  ✅
    Book:
      title e author_id são obrigatórios.  ✅
      
    User:
      name e email são obrigatórios.  ✅
      email deve ter um formato válido.  ✅
    Rental:
      start_date, user_id e book_id são obrigatórios.✅
      end_date, se presente, deve ser posterior a start_date.✅
```
## como-usar

### Buildando a imagem
```docker compose build```

### Subindo o projeto
```docker compose up -d```

### Entrando em um container que esteja rodando
```docker compose exec web bash```

Com o servidor rodando visite [http://localhost:3000](http://localhost:3000)/

## Testes
Para rodar todos os testes utilize o comando 
~~~ruby
rspec
~~~
