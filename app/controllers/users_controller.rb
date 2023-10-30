class UsersController < ApplicationController

  before_action :authenticate_user!

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to root_path, notice: "successfully"
  #   else
  #     render :new
  #   end8
  # end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
      flash[:editUserSuccess] = "successfully Update Profile"
    else
      render :edit

    end
  end

  def index
    @users = User.all
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
