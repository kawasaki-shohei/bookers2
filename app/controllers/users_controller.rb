class UsersController < ApplicationController
  def index
    @new_book = current_user.books.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
