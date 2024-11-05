class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @rentals = @user.rentals
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t(".success")
      redirect_to @user
    else
      flash[:danger] = t(".fail")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t(".success")
      redirect_to @user
    else
      flash[:danger] = t(".fail")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.rentals.exists?
      flash[:danger] = t(".fail")
      redirect_to users_path
    else
      @user.destroy
      flash[:success] = t(".success")
      redirect_to users_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
