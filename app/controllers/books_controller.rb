class BooksController < ApplicationController
  def index
    @user = current_user
    @new_book = current_user.books.new
    @books = Book.includes(:user).all
  end

  def create
    @new_book = current_user.books.new(book_params)
    if @new_book.save
      redirect_to book_path(@new_book), notice: "You have created book successfully."
    else
      @user = current_user
      @books = Book.includes(:user).all
      render :index
    end
  end

  def show
    @book = Book.includes(:user).find(params[:id])
    @user = @book.user
    @new_book = current_user.books.new
  end

  def edit
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
