class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = t(".success")
      redirect_to @author
    else
      flash[:warning] = t(".fail")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to @author, notice: t(".success")
    else
      flash[:warning] = t(".fail")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.books.exists?
      flash[:warning] = t(".fail")
      redirect_to authors_path
    else
      @author.destroy
      flash[:success] = t(".success")
      redirect_to authors_path
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :bio)
  end
end
