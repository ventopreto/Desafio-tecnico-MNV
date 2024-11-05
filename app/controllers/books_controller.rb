# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_authors, only: %i[new create edit update]
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = t(".success")
      redirect_to @book
    else
      flash[:danger] = t(".fail")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:success] = t(".success")
      redirect_to [@book]
    else
      flash[:danger] = t(".fail")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.rental
      flash[:danger] = t(".fail")
    else
      @book.destroy
      flash[:success] = t(".success")
    end
    redirect_to books_path
  end

  private

  def set_authors
    @authors = Author.all
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :synopsis, :published_at, :author_id)
  end
end
