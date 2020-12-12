class UsersController < ApplicationController
  def index
    @new_book = current_user.books.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = current_user.books.new
    render 'books/index'
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
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
