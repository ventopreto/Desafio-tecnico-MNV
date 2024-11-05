# frozen_string_literal: true

class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show edit update destroy]
  before_action :set_users, only: %i[new edit]
  before_action :set_books, only: %i[new edit]

  def index
    @rentals = Rental.all.active
  end

  def show
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      flash[:success] = t(".success")
      redirect_to @rental
    else
      flash[:danger] = t(".fail")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      flash[:success] = t(".success")
      redirect_to [@rental]
    else
      flash[:danger] = t(".fail")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @rental.active?
      @rental.update(status: "completed", end_date: Time.zone.today)
      flash[:success] = t(".success")
    else
      flash[:success] = t(".fail")
    end
    redirect_to rentals_path
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def set_users
    @users = User.all
  end

  def set_books
    @books = Book.all
  end

  def rental_params
    params.require(:rental).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
