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
end
